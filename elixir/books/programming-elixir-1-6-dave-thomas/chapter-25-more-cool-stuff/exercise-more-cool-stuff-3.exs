defmodule CsvSigil do
  def sigil_v(lines, 'h') do
    [header_line | remaining] = parse_lines(lines)

    remaining
    |> Enum.map(fn row ->
      row
      |> Enum.with_index()
      |> Enum.map(fn {element, index} ->
        {header_line |> Enum.at(index) |> String.to_atom(), element}
      end)
    end)
  end

  def sigil_v(lines, []) do
    parse_lines(lines)
  end

  defp parse_lines(lines) do
    lines
    |> String.split("\n", trim: true)
    |> Enum.map(
      &(String.split(&1, ",")
        |> Enum.map(fn elem ->
          case Float.parse(elem) do
            {val, ""} -> val
            _ -> elem
          end
        end))
    )
  end
end

defmodule Test do
  import CsvSigil

  def data do
    ~v"""
    Item,Qty,Price
    Teddy bear,4,34.95
    Milk,1,2.99
    Battery,6,8.00
    """h
  end
end

IO.inspect(Test.data())
