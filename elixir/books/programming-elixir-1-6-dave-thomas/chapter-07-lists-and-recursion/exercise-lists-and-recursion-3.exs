defmodule MyList do
  def caesar([], _), do: []

  def caesar([char | tail], n) do
    [get_char_code_for(char + n) | caesar(tail, n)]
  end

  defp get_char_code_for(char) when char > ?z do
    ?a - 1 + (char - ?z)
  end

  defp get_char_code_for(char), do: char
end
