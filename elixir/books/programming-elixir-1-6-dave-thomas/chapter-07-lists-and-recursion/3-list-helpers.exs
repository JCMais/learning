defmodule ListHelpers do
  def length([]), do: 0
  def length([_head | tail]), do: 1 + ListHelpers.length(tail)

  def square([]), do: []
  def square([head | tail]) when is_number(head), do: [head * head | square(tail)]

  # This could be simple, in the book it shows just an add to 1
  # Instead I wanted something that could add n, and that I could capture the returning fn
  # This looks like currying, http://blog.patrikstorm.com/function-currying-in-elixir
  defp add(n, []) when is_number(n), do: []
  defp add(n, [head | tail]) when is_number(n) when is_number(head), do: [head + n | add(n, tail)]

  # iex(15)> ListHelpers.addN(1).([1,2,3,4,5])
  # [2, 3, 4, 5, 6]
  # iex(16)> ListHelpers.addN(2).([1,2,3,4,5])
  # [3, 4, 5, 6, 7]
  def addN(n) when is_number(n),
    do: fn
      numbers when is_list(numbers) -> add(n, numbers)
    end

  # Book one is just a map without index
  defp mapp(list, func, idx \\ 0)
  defp mapp([], _func, _idx), do: []
  defp mapp([head | tail], func, idx), do: [func.(head, idx) | mapp(tail, func, idx + 1)]

  def map(list, func), do: mapp(list, func)
  # iex(18)> ListHelpers.map([1,2,3,4], fn (val, _idx) -> val + 1 end)
  # [2, 3, 4, 5]
  # iex(19)> ListHelpers.map([1,2,3,4], fn (val, _idx) -> val * 2 end)
  # [2, 4, 6, 8]
  # iex(20)> ListHelpers.map([1,2,3,4], fn (val, idx) -> val + idx  end)
  # [1, 3, 5, 7]

  def reduce([], value, _fn), do: value

  def reduce([head | tail], initial_value, reducer),
    do: reduce(tail, reducer.(head, initial_value), reducer)

  # We can have multiple values as the head:
  def swap([]), do: []
  def swap([a, b | tail]), do: [b, a | swap(tail)]
  def swap([_]), do: raise("Can't swap a list with an odd number of elements")
  # iex(35)> ListHelpers.swap([1,2,3,4])
  # [2, 1, 4, 3]
  # iex(36)> ListHelpers.swap([1,2,3,4, 5])
  # ** (RuntimeError) Can't swap a list with an odd number of elements
  #     lists/list_helpers.exs:44: ListHelpers.swap/1
  #     lists/list_helpers.exs:43: ListHelpers.swap/1
end
