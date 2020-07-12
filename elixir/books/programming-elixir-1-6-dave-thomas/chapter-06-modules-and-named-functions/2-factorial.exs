defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end

# 6
IO.puts(Factorial.of(3))
# 5040
IO.puts(Factorial.of(7))
