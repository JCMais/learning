defmodule Frequency do
  @me __MODULE__

  def start_link do
    Agent.start_link(fn -> %{} end, name: @me)
  end

  def add_word(word) do
    Agent.update(@me, fn map -> Map.update(map, word, 1, &(&1 + 1)) end)
  end

  def count_for(word) do
    Agent.get(@me, fn map -> map[word] end)
  end

  def words do
    Agent.get(__MODULE__, fn map -> Map.keys(map) end)
  end
end

# iex(1)> c "3-agents-dict.exs"
# [Frequency]
# iex(2)> Frequency.start_link
# start_link/0
# iex(2)> Frequency.start_link
# {:ok, #PID<0.115.0>}
# iex(3)> Frequency.add_word "dave"
# :ok
# iex(4)> Frequency.add_word "was" 
# :ok
# iex(5)> Frequency.add_word "here"
# :ok
# iex(6)> Frequency.add_word "he"  
# :ok
# iex(7)> Frequency.add_word "was"
# :ok
# iex(8)> Frequency.words
# ["dave", "he", "here", "was"]
# iex(9)> Frequency.add_word "was"
# :ok
# iex(10)> Frequency.count_for("dave") 
# 1
# iex(11)> Frequency.count_for("was") 
# 3
# iex(12)>
