defmodule ExerciseStringsAndBinaries6 do
  def capitalize(string) when is_binary(string) do
    _capitalize(string, "", "")
  end

  # we finished processing the string, just return the result
  #  with anything still on acc.
  defp _capitalize(<<>>, acc, result) do
    result <> acc
  end

  # Handles when each term ends, that is, . is the current character
  defp _capitalize(<<?.::utf8, remaining::binary>>, acc, result) do
    capitalized_term = capitalize_string_with_spaces(acc <> ".")
    _capitalize(remaining, "", result <> capitalized_term)
  end

  # keep adding head to acc while . is not found
  defp _capitalize(<<head::utf8, remaining::binary>>, acc, result) do
    _capitalize(remaining, acc <> <<head::utf8>>, result)
  end

  defp capitalize_string_with_spaces(string, acc \\ "")
  # if space, just add it to accumulator
  defp capitalize_string_with_spaces(<<?\s::utf8, tail::binary>>, acc) do
    capitalize_string_with_spaces(tail, acc <> " ")
  end

  # head is not a space, capitalize it with their tail
  defp capitalize_string_with_spaces(<<head::utf8, tail::binary>>, acc) do
    acc <> String.capitalize(<<head::utf8>> <> tail)
  end
end

IO.puts("ExerciseStringsAndBinaries6.capitalize(\"...\")")
IO.inspect(ExerciseStringsAndBinaries6.capitalize("..."))
# ...
IO.puts("ExerciseStringsAndBinaries6.capitalize(\"oh. a DOG. woof. \")")
IO.inspect(ExerciseStringsAndBinaries6.capitalize("oh. a DOG. woof. "))
# "Oh. A dog. Woof. "
IO.puts("ExerciseStringsAndBinaries6.capitalize(\"oh.  a DOG. woof. \")")
IO.inspect(ExerciseStringsAndBinaries6.capitalize("oh.  a DOG. woof. "))
# "Oh.  A dog. Woof. "
