defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(n) * 2
end

# 8
IO.puts(Times.double(4))
# 12
IO.puts(Times.triple(4))
# 16
IO.puts(Times.quadruple(4))
