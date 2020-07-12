defmodule CsvSigil do
  def sigil_v(lines, _opts) do
    lines
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, ","))
  end
end

defmodule Test do
  import CsvSigil

  def data do
    ~v"""
    1,2,3
    cat,dog
    """
  end
end

IO.inspect(Test.data())
