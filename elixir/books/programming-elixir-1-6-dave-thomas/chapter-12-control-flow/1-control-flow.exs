defmodule ControlFlow do
  def fizzbuzz(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz_cond/1)
  end

  # Book's example, cond
  defp fizzbuzz_cond(n) do
    cond do
      rem(n, 3) == 0 and rem(n, 5) == 0 ->
        "FizzBuzz"

      rem(n, 3) == 0 ->
        "Fizz"

      rem(n, 5) == 0 ->
        "Buzz"

      true ->
        n
    end
  end

  # Book's example, pattern matching using fn calls
  defp fizzbuzz_fn(n), do: fizzword(n, rem(n, 3), rem(n, 5))
  defp fizzword(_n, 0, 0), do: "FizzBuzz"
  defp fizzword(_n, 0, _), do: "Fizz"
  defp fizzword(_n, _, 0), do: "Buzz"
  defp fizzword(n, _, _), do: n

  def run() do
    IO.puts(fizzbuzz(20) |> Enum.join("\n"))
  end
end
