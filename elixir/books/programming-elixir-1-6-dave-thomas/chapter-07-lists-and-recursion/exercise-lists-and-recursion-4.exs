defmodule MyList do
  def span(from, to) when to === from, do: [from]

  def span(from, to) when is_integer(from) and is_integer(to) and to > from do
    # if we wanted to "cheat"
    # from..to |> Enum.to_list
    do_span([], to, from)
    # do_span_2(from, to)
  end

  # we are doing it the inverse order because prepending values to a list takes O(1) (constant) time
  #  while appending (using ++) takes O(n) time.
  defp do_span(list, current, target) when current < target, do: list

  defp do_span(list, current, target) do
    do_span([current | list], current - 1, target)
  end

  # this is another alternative - but I don't know if the tail recursion optmization will kick in here
  defp do_span_2(current, target) when current > target, do: []

  defp do_span_2(current, target) do
    [current | do_span_2(current + 1, target)]
  end
end
