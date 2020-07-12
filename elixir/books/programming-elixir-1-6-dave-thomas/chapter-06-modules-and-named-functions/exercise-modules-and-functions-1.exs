defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
end

# 8
IO.puts(Times.double(4))
# 12
IO.puts(Times.triple(4))
