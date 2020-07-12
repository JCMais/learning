defmodule MyList do
  def mapsum([], _), do: 0
  def mapsum(list, fun), do: do_mapsum(list, fun, 0)

  defp do_mapsum([], _fun, acc), do: acc

  defp do_mapsum([head | tail], fun, acc) do
    do_mapsum(tail, fun, acc + fun.(head))
  end
end
