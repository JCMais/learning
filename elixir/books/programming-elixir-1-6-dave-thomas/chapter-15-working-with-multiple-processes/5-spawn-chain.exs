# Run with: elixir -r 5-spawn-chain.ex -e "SpawnChain.run(10)"
# elixir -r chain.exs -e "Chain.run(400_000)" will cause [error] Too many processes
# We can increase it by running with an extra VM parameter:
#  elixir --erl "+P 1000000" -r chain.exs -e "Chain.run(400_000)"
defmodule SpawnChain do
  def counter(next_pid) do
    receive do
      n -> send(next_pid, n + 1)
    end
  end

  def create_processes(n) do
    code_to_run = fn _, send_to -> spawn(SpawnChain, :counter, [send_to]) end
    # This will create all processes
    #  where the first process is ourselves
    last = Enum.reduce(1..n, self(), code_to_run)

    # start the count by sending a zero to the last process
    send(last, 0)

    # and wait for the last result to come back to us
    receive do
      # this is only really needed due to an old Elixir bug already fixed
      # https://github.com/elixir-lang/elixir/issues/1050
      final_answer when is_integer(final_answer) -> "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    :timer.tc(SpawnChain, :create_processes, [n])
    |> IO.inspect()
  end
end
