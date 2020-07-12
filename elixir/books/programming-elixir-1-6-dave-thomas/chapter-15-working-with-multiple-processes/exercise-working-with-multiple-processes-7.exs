defmodule ExerciseWorkingWithMultipleProcesses7 do
  def random_in_range(x..y) when x < y do
    round(:rand.uniform() * (y - x) + x)
  end

  def pmap_bugged(collection, fun) do
    me = self()

    collection
    |> Enum.map(fn elem ->
      spawn_link(fn ->
        :timer.sleep(random_in_range(500..2000))
        send(me, {self(), fun.(elem)})
      end)
    end)
    |> Enum.map(fn _pid ->
      receive do
        # We need to match the exact pid in this receive block
        #  so that the data returned is in the correct order.
        {_pid, result} -> result
      end
    end)
  end

  def pmap(collection, fun) do
    me = self()

    collection
    |> Enum.map(fn elem ->
      spawn_link(fn ->
        :timer.sleep(random_in_range(500..2000))
        send(me, {self(), fun.(elem)})
      end)
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
    range = 1..10
    IO.puts(inspect(pmap_bugged(range, &(&1 * 2))))
    IO.puts(inspect(pmap(range, &(&1 * 2))))
  end
end
