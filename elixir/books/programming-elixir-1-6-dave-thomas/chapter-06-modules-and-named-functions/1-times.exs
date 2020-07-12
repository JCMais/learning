defmodule Times do
  def double(n) do
    n * 2
  end

  # this is the original syntax
  def double_do_syntax(n), do: n * 2

  # the do / end is just syntax sugar for this:
  def double_do_syntax2(n),
    do:
      (
        IO.puts(n)
        # multiline
        n * 2
      )
end

# 8
IO.puts(Times.double(4))
