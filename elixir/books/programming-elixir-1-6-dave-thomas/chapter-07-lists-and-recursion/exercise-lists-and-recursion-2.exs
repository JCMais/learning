defmodule MyList do
  def max([]), do: nil
  def max(list) when is_list(list), do: do_max(list, 0)
  defp do_max([], acc), do: acc

  defp do_max([head | tail], acc) do
    do_max(tail, Elixir.Kernel.max(head, acc))
  end
end
