defmodule Parallel do
  @moduledoc """
  Run with chapter-15/elixir -r 8-parallel-map.ex -e "Parallel.run"
  """
  def pmap(collection, fun) do
    me = self()

    collection
    |> Enum.map(fn elem ->
      spawn_link(fn -> send(me, {self(), fun.(elem)}) end)
    end)
    |> Enum.map(fn pid ->
      receive do
        # We need to match the exact pid in this receive block
        #  so that the data returned is in the correct order.
        {^pid, result} -> result
      end
    end)
  end

  def run do
    IO.puts(inspect(pmap(1..100, &(&1 * 2))))
  end
end
