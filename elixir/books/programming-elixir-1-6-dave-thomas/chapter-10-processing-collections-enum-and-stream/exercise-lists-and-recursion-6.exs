defmodule MyList do
  defp do_flatten([], tail), do: tail

  defp do_flatten([h | t], tail) when is_list(h) do
    do_flatten(h, do_flatten(t, tail))
  end

  defp do_flatten([h | t], tail) do
    [h | do_flatten(t, tail)]
  end

  def flatten(list) when is_list(list) do
    do_flatten(list, [])
  end
end

defmodule Test do
  def run do
    list = [1, [2, 3, [4]], 5, [[[6]]]]

    IO.puts("list = [1, [2, 3, [4]], 5, [[[6]]]]")
    IO.puts("MyList.flatten(list) == [1, 2, 3, 4, 5, 6]")
    IO.inspect(MyList.flatten(list) == [1, 2, 3, 4, 5, 6])
  end
end
