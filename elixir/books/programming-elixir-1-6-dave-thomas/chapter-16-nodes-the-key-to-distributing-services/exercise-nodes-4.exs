defmodule RingTicker do
  @name :ring_ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send(:global.whereis_name(@name), {:register, client_pid})
  end

  defp update_ring_structure(clients, first \\ nil)

  # this will be the first run
  defp update_ring_structure([first | others], nil) do
    update_ring_structure([first | others], first)
  end

  # this is the remaining runs but the last
  defp update_ring_structure([curr | [next | tail]], first) do
    send(curr, {:update_next_client, next})

    update_ring_structure([next | tail], first)
  end

  # last run
  defp update_ring_structure([curr | []], first) do
    send(curr, {:update_next_client, first})

    update_ring_structure([], nil)
  end

  defp update_ring_structure([], nil), do: nil

  def generator(clients) do
    receive do
      {:register, pid} ->
        IO.puts("registering #{inspect(pid)}")
        new_clients = clients ++ [pid]
        update_ring_structure(new_clients)

        with [] <- clients do
          send(pid, {:tick})
        end

        generator(new_clients)
    end
  end
end

defmodule Client do
  # 2 seconds
  @interval 2000

  def start do
    pid = spawn(__MODULE__, :receiver, [nil, false])
    RingTicker.register(pid)
  end

  def receiver(next, is_current) do
    receive do
      {:update_next_client, updated_next} ->
        IO.puts("updating next pid to #{inspect(updated_next)}")
        receiver(updated_next, is_current)

      {:tick} ->
        IO.puts("tock in client")

        receiver(next, true)
    after
      @interval ->
        IO.puts("client tick")
        IO.puts("#{inspect(next)} - #{inspect(is_current)}")

        with {client, true} when not is_nil(client) <- {next, is_current} do
          send(client, {:tick})
        end

        receiver(next, false)
    end
  end
end
