defmodule MyEnum do
  def each(enum, fun) do
    case Enum.count(enum) do
      0 ->
        :ok

      _ ->
        enum
        |> Enum.reduce(:ok, fn el, _ ->
          fun.(el)
          :ok
        end)
    end
  end

  def filter(enum, fun) do
    case Enum.count(enum) do
      0 ->
        []

      _ ->
        enum
        |> Enum.reduce([], fn element, acc ->
          case fun.(element) do
            val when val in [false, nil] -> acc
            _ -> [element | acc]
          end
        end)
        |> Enum.reverse()
    end
  end

  def map(enum, fun) do
    case Enum.count(enum) do
      0 ->
        []

      _ ->
        enum
        |> Enum.reduce([], fn element, acc ->
          [fun.(element) | acc]
        end)
        |> Enum.reverse()
    end
  end
end

list = []
IO.puts("- running MyEnum.each for #{inspect(list)}")
result = list |> MyEnum.each(&IO.inspect/1)
IO.puts("- result: #{inspect(result)}")
IO.puts("----")
list = ["a", "b"]
IO.puts("- running MyEnum.each for #{inspect(list)}")
result = list |> MyEnum.each(&IO.inspect/1)
IO.puts("- result: #{inspect(result)}")

IO.puts("\n----###-----\n")

list = []
IO.puts("- running MyEnum.filter !!el for #{inspect(list)}")
result = list |> MyEnum.filter(fn el -> !!el end)
IO.puts("- result: #{inspect(result)}")
IO.puts("----")
list = [2, 3, 4, 5]
IO.puts("- running MyEnum.filter rem(el, 2) == 0 for #{inspect(list)}")
result = list |> MyEnum.filter(fn el -> rem(el, 2) == 0 end)
IO.puts("- result: #{inspect(result)}")

IO.puts("\n----###-----\n")

list = []
IO.puts("- running MyEnum.map 1 for #{inspect(list)}")
result = list |> MyEnum.map(fn _el -> 1 end)
IO.puts("- result: #{inspect(result)}")
IO.puts("----")
list = [2, 3, 4, 5]
IO.puts("- running MyEnum.map el * el for #{inspect(list)}")
result = list |> MyEnum.map(fn el -> el * el end)
IO.puts("- result: #{inspect(result)}")
