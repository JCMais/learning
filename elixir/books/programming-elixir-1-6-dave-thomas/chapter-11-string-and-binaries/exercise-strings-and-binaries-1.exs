defmodule ExerciseStringsAndBinaries1 do
  def only_printable?([]), do: true

  def only_printable?([char | rem]) when is_integer(char) do
    ?\s <= char and char <= ?~ and only_printable?(rem)
  end
end

IO.puts("ExerciseStringsAndBinaries1.only_printable?('abcdef')")
IO.inspect(ExerciseStringsAndBinaries1.only_printable?('abcdef'))
IO.puts("ExerciseStringsAndBinaries1.only_printable?('zyxwv')")
IO.inspect(ExerciseStringsAndBinaries1.only_printable?('zyxwv'))
IO.puts("ExerciseStringsAndBinaries1.only_printable?('abe∂gd')")
IO.inspect(ExerciseStringsAndBinaries1.only_printable?('abe∂gd'))
