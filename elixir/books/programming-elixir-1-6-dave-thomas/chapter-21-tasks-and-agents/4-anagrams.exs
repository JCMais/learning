defmodule Dictionary do
  @me __MODULE__

  #######
  # Client
  #######
  def start_link,
    do: Agent.start_link(fn -> %{} end, name: @me)

  def add_words(words),
    do: Agent.update(@me, &do_add_words(&1, words))

  def anagrams_of(word),
    do: Agent.get(@me, &Map.get(&1, signature_of(word)))

  ##
  # Internal implementation
  defp do_add_words(map, words),
    do: Enum.reduce(words, map, &add_one_word(&1, &2))

  defp add_one_word(word, map),
    do: Map.update(map, signature_of(word), [word], &[word | &1])

  defp signature_of(word),
    do: word |> to_charlist |> Enum.sort() |> to_string
end

defmodule WordlistLoader do
  def load_from_files(file_names) do
    file_names
    |> Stream.map(fn name -> Task.async(fn -> load_task(name) end) end)
    |> Enum.map(&Task.await/1)
  end

  defp load_task(file_name) do
    File.stream!(file_name, [], :line)
    |> Enum.map(&String.trim/1)
    |> Dictionary.add_words()
  end
end

# iex(1)> c "4-anagrams.exs"
# [Dictionary, WordlistLoader]
# iex(2)> Dictionary.start_link
# {:ok, #PID<0.118.0>}
# iex(3)> Enum.map(1..4, &"words-lists/list#{&1}.txt") |> WordlistLoader.load_from_files
# [:ok, :ok, :ok, :ok]
# iex(4)> Dictionary.anagrams_of "organ"
# ["ronga", "rogan", "orang", "nagor", "groan", "grano", "goran", "argon",
#  "angor"]
