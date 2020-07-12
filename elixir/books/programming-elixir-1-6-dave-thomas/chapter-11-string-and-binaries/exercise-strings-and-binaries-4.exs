defmodule ExerciseStringsAndBinaries4 do
  def calculate(formula) do
    calculate_numbers(formula, 0, nil, 0)
  end

  # Everything set, just do the math
  defp calculate_numbers([], left_number, ?+, right_number), do: left_number + right_number
  defp calculate_numbers([], left_number, ?-, right_number), do: left_number - right_number
  defp calculate_numbers([], left_number, ?/, right_number), do: left_number / right_number
  defp calculate_numbers([], left_number, ?*, right_number), do: left_number * right_number

  # this is the first call to the method
  # Lets calculate the left number
  defp calculate_numbers([head | tail], left_number, nil, 0) when head in '0123456789' do
    calculate_numbers(tail, left_number * 10 + head - ?0, nil, 0)
  end

  # We arrived at the operator
  defp calculate_numbers([head | tail], left_number, _operator, 0)
       when head in '+-/*' and is_integer(left_number) do
    calculate_numbers(tail, left_number, head, 0)
  end

  # Now let's calculate the right number
  defp calculate_numbers([head | tail], left_number, operator, right_number)
       when head in '0123456789' do
    calculate_numbers(tail, left_number, operator, right_number * 10 + head - ?0)
  end
end

IO.puts("ExerciseStringsAndBinaries4.calculate('4+4')")
IO.inspect(ExerciseStringsAndBinaries4.calculate('4+4'))

IO.puts("ExerciseStringsAndBinaries4.calculate('288+2')")
IO.inspect(ExerciseStringsAndBinaries4.calculate('288+2'))

IO.puts("ExerciseStringsAndBinaries4.calculate('150/2')")
IO.inspect(ExerciseStringsAndBinaries4.calculate('150/2'))

IO.puts("ExerciseStringsAndBinaries4.calculate('300-2')")
IO.inspect(ExerciseStringsAndBinaries4.calculate('300-2'))

IO.puts("ExerciseStringsAndBinaries4.calculate('310*2')")
IO.inspect(ExerciseStringsAndBinaries4.calculate('310*2'))
