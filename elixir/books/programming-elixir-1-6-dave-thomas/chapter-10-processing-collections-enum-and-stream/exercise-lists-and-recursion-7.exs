# https://hexdocs.pm/elixir/Code.html#compile_file/2
Code.compile_file("exercise-lists-and-recursion-4.exs", "../chapter-07-lists-and-recursion")

defmodule PrimeNumbers do
  defp is_divisible_by_anything_on_range(_, from, to) when to < from, do: false

  defp is_divisible_by_anything_on_range(x, from, to) do
    range = MyList.span(from, to)
    Enum.any?(range, &(rem(x, &1) == 0))
  end

  def get(from, to)
      when is_number(from) and is_number(to) and to >= from and from >= 2 do
    list = MyList.span(from, to)

    for x <- list, !is_divisible_by_anything_on_range(x, 2, x - 1), do: x
  end
end
