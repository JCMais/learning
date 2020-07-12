defmodule Parallel do
  def pmap(collection, func) do
    collection
    |> Enum.map(&Task.async(fn -> func.(&1) end))
    |> Enum.map(&Task.await/1)
  end

  def run() do
    # this will kick 1,000 background processes
    Parallel.pmap(1..1000, &(&1 * &1))
  end
end
