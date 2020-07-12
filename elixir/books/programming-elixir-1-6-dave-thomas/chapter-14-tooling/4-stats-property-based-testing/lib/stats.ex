defmodule Stats do
  def sum(values), do: values |> Enum.reduce(&+/2)
  def count(values), do: values |> length
  def average(values), do: sum(values) / count(values)
end
