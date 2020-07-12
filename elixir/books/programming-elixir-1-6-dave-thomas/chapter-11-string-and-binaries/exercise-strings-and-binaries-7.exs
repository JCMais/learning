Code.compile_file(
  "exercise-lists-and-recursion-8.exs",
  "../chapter-10-processing-collections-enum-and-stream"
)

defmodule CsvParser do
  def read_csv(filepath, options \\ []) do
    {:ok, fd} = File.open(filepath)

    stream = IO.stream(fd, :line)

    {_, data} =
      stream
      |> Enum.with_index()
      |> Enum.map(&each_line(&1, options[:column_parsers]))
      |> Enum.reduce({[], []}, &reduce_line_items/2)

    File.close(fd)

    {:ok, data}
  end

  # headers line
  defp each_line({data, 0}, _), do: convert_line_to_array(data)

  defp each_line({data, _line}, parsers) do
    data |> convert_line_to_array |> parse_line_items(parsers)
  end

  defp convert_line_to_array(line), do: line |> String.trim_trailing("\n") |> String.split(",")

  defp parse_line_items(line_items, parsers) do
    line_items
    |> Enum.with_index()
    |> Enum.map(fn {data, index} ->
      # IO.inspect([data, index, parsers, Enum.at(parsers, index)])
      Enum.at(parsers, index).(data)
    end)
  end

  # When acc is an tuple with empty lists it means that this is the first iteration
  # So we are at the headers of the csv
  defp reduce_line_items(element, {[], []}) do
    {Enum.map(element, &String.to_atom/1), []}
  end

  defp reduce_line_items(element, {headers, list}) do
    {headers,
     list
     |> Enum.concat([
       element
       |> Enum.with_index()
       |> Enum.map(fn {el, index} -> {Enum.at(headers, index), el} end)
     ])}
  end
end

defmodule ExerciseStringsAndBinaries7 do
  def run() do
    str_to_int = &(&1 |> String.trim() |> String.to_integer(10))
    str_to_atom = &(&1 |> String.trim() |> String.slice(1..-1) |> String.to_atom())
    str_to_float = &(&1 |> String.trim() |> String.to_float())

    {:ok, orders} =
      CsvParser.read_csv("./orders.csv",
        column_parsers: [str_to_int, str_to_atom, str_to_float]
      )

    tax_rates = [NC: 0.075, TX: 0.08]

    TaxCalculator.calculate_taxes(tax_rates, orders)
  end
end
