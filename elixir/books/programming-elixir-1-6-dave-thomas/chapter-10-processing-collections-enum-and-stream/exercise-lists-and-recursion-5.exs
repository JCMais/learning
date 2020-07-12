defmodule MyEnum do
  #
  # All
  #
  def all?(list, func \\ &(!!&1))
  def all?([], _), do: true

  def all?([head | tail], func) do
    func.(head) && all?(tail, func)
  end

  #
  # Each
  #
  def each([], _func), do: :ok

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  #
  # Filter
  #
  def filter([], _condition), do: []

  def filter([head | tail], condition) do
    case !!condition.(head) do
      true -> [head | filter(tail, condition)]
      false -> filter(tail, condition)
    end
  end

  #
  # Length
  #
  def my_length([]), do: 0

  def my_length([_ | tail]) do
    1 + length(tail)
  end

  #
  # Split
  #
  defp do_split_grab_first_half(list, count) when list == [] or count <= 0 do
    []
  end

  defp do_split_grab_first_half([head | tail], count) do
    [head | do_split_grab_first_half(tail, count - 1)]
  end

  defp do_split_grab_second_half([], _count) do
    []
  end

  defp do_split_grab_second_half(list, count) when count <= 0 do
    list
  end

  defp do_split_grab_second_half([head | tail], count) do
    do_split_grab_second_half(tail, count - 1)
  end

  def split(list, 0) do
    {[], list}
  end

  def split(list, count) when count > 0 do
    {do_split_grab_first_half(list, count), do_split_grab_second_half(list, count)}
  end

  def split(list, count) when count < 0 do
    length = my_length(list)

    count = length + count

    {do_split_grab_first_half(list, count), do_split_grab_second_half(list, count)}
  end

  #
  # Take
  #
  defp do_take(list, _skip, count) when list == [] or count == 0, do: []

  defp do_take(list, skip, _count) when skip < 0, do: list

  defp do_take([head | tail], 0, count) do
    [head | do_take(tail, 0, count - 1)]
  end

  defp do_take([_ | tail], skip, count) do
    do_take(tail, skip - 1, count)
  end

  def take(list, count) when count < 0 do
    length = my_length(list)
    skip = length + count
    do_take(list, skip, count)
  end

  def take(list, count) do
    do_take(list, 0, count)
  end
end

defmodule Test do
  def run do
    list = [1, 2, 3, 4, 5]
    IO.puts("List: #{inspect(list)}")

    IO.puts("MyEnum.all?(list, &is_number/1)")
    IO.inspect(MyEnum.all?(list, &is_number/1))

    IO.puts("MyEnum.all?(list, &is_atom/1)")
    IO.inspect(MyEnum.all?(list, &is_atom/1))

    IO.puts("MyEnum.each(list, fn x -> IO.puts(x) end)")
    IO.inspect(MyEnum.each(list, fn x -> IO.puts(x) end))

    IO.puts("MyEnum.filter([1, 2, 3], fn x -> x >= 2 end)")
    IO.inspect(MyEnum.filter([1, 2, 3], fn x -> x >= 2 end))

    IO.puts("MyEnum.split(list, 0) = #{inspect(MyEnum.split(list, 0))}")
    IO.puts("Enum.split(list, 0) == MyEnum.split(list, 0)")
    IO.inspect(Enum.split(list, 0) == MyEnum.split(list, 0))
    IO.puts("")

    IO.puts("MyEnum.split(list, 3) = #{inspect(MyEnum.split(list, 3))}")
    IO.puts("Enum.split(list, 3) == MyEnum.split(list, 3)")
    IO.inspect(Enum.split(list, 3) == MyEnum.split(list, 3))
    IO.puts("")

    IO.puts("MyEnum.split(list, 10) = #{inspect(MyEnum.split(list, 10))}")
    IO.puts("Enum.split(list, 10) == MyEnum.split(list, 10)")
    IO.inspect(Enum.split(list, 10) == MyEnum.split(list, 10))
    IO.puts("")

    IO.puts("MyEnum.split(list, -3) = #{inspect(MyEnum.split(list, -3))}")
    IO.puts("Enum.split(list, -3) == MyEnum.split(list, -3)")
    IO.inspect(Enum.split(list, -3) == MyEnum.split(list, -3))
    IO.puts("")

    IO.puts("MyEnum.split(list, -10) = #{inspect(MyEnum.split(list, -10))}")
    IO.puts("Enum.split(list, -10) == MyEnum.split(list, -10)")
    IO.inspect(Enum.split(list, -10) == MyEnum.split(list, -10))
    IO.puts("")

    #
    # Take Tests
    #

    IO.puts("MyEnum.take([1,2,3,4], 0) == #{inspect(MyEnum.take([1, 2, 3, 4], 0))}")
    IO.puts("MyEnum.take([1,2,3,4], 0) == Enum.take([1,2,3,4], 0)")
    IO.inspect(MyEnum.take([1, 2, 3, 4], 0) == Enum.take([1, 2, 3, 4], 0))
    IO.puts("")

    IO.puts("MyEnum.take([1,2,3,4], 1) == #{inspect(MyEnum.take([1, 2, 3, 4], 1))}")
    IO.puts("MyEnum.take([1,2,3,4], 1) == Enum.take([1,2,3,4], 1)")
    IO.inspect(MyEnum.take([1, 2, 3, 4], 1) == Enum.take([1, 2, 3, 4], 1))
    IO.puts("")

    IO.puts("MyEnum.take([1,2,3,4], 3) == #{inspect(MyEnum.take([1, 2, 3, 4], 3))}")
    IO.puts("MyEnum.take([1,2,3,4], 3) == Enum.take([1,2,3,4], 3)")
    IO.inspect(MyEnum.take([1, 2, 3, 4], 3) == Enum.take([1, 2, 3, 4], 3))
    IO.puts("")

    IO.puts("MyEnum.take([1,2,3,4], 4) == #{inspect(MyEnum.take([1, 2, 3, 4], 4))}")
    IO.puts("MyEnum.take([1,2,3,4], 4) == Enum.take([1,2,3,4], 4)")
    IO.inspect(MyEnum.take([1, 2, 3, 4], 4) == Enum.take([1, 2, 3, 4], 4))
    IO.puts("")

    IO.puts("MyEnum.take([1,2,3,4], 5) == #{inspect(MyEnum.take([1, 2, 3, 4], 5))}")
    IO.puts("MyEnum.take([1,2,3,4], 5) == Enum.take([1,2,3,4], 5)")
    IO.inspect(MyEnum.take([1, 2, 3, 4], 5) == Enum.take([1, 2, 3, 4], 5))
    IO.puts("")

    IO.puts("MyEnum.take([1,2,3,4], -1) == #{inspect(MyEnum.take([1, 2, 3, 4], -1))}")
    IO.puts("MyEnum.take([1,2,3,4], -1) == Enum.take([1,2,3,4], -1)")
    IO.inspect(MyEnum.take([1, 2, 3, 4], -1) == Enum.take([1, 2, 3, 4], -1))
    IO.puts("")

    IO.puts("MyEnum.take([1,2,3,4], -5) == #{inspect(MyEnum.take([1, 2, 3, 4], -5))}")
    IO.puts("MyEnum.take([1,2,3,4], -5) == Enum.take([1,2,3,4], -5)")
    IO.inspect(MyEnum.take([1, 2, 3, 4], -5) == Enum.take([1, 2, 3, 4], -5))
    IO.puts("")

    nil
  end
end
