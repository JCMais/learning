defmodule ExerciseStringsAndBinaries2 do
  defp sorted_charlist(charlist),
    do: charlist |> to_string |> String.downcase() |> to_charlist |> Enum.sort()

  def is_anagram?(word1, word2) when length(word1) != length(word2), do: false
  def is_anagram?(word1, word2) when word1 == word2, do: true

  def is_anagram?(word1, word2) when is_list(word1) and is_list(word2) do
    sorted_charlist(word1) == sorted_charlist(word2)
  end
end

IO.puts("ExerciseStringsAndBinaries2.is_anagram?('tenet', 'tenet')")
IO.inspect(ExerciseStringsAndBinaries2.is_anagram?('tenet', 'tenet'))
IO.puts("ExerciseStringsAndBinaries2.is_anagram?('silEnt', 'lisTen')")
IO.inspect(ExerciseStringsAndBinaries2.is_anagram?('silEnt', 'lisTen'))
IO.puts("ExerciseStringsAndBinaries2.is_anagram?('abcd', 'efgh')")
IO.inspect(ExerciseStringsAndBinaries2.is_anagram?('abcd', 'efgh'))
IO.puts("ExerciseStringsAndBinaries2.is_anagram?('ab', 'abb')")
IO.inspect(ExerciseStringsAndBinaries2.is_anagram?('ab', 'abb'))
