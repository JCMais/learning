defmodule Ticker do
  # 2 seconds
  @interval 2000
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], []])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send(:global.whereis_name(@name), {:register, client_pid})
  end

  def generator(clients_pending, clients_sent) do
    receive do
      {:register, pid} ->
        IO.puts("registering #{inspect(pid)}")
        generator(clients_pending ++ [pid], clients_sent)
    after
      @interval ->
        IO.puts("tick")

        {clients_pending, clients_sent} =
          case {clients_pending, clients_sent} do
            {[next_client | clients_pending], clients_sent} ->
              send(next_client, {:tick})
              {clients_pending, [next_client | clients_sent]}

            {[], clients_sent} when clients_sent != [] ->
              [next_client | clients_pending] = clients_sent |> Enum.reverse()
              send(next_client, {:tick})
              {clients_pending, [next_client]}

            {[], []} ->
              {[], []}
          end

        generator(clients_pending, clients_sent)
    end
  end
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick} ->
        IO.puts("tock in client")

        receiver()
    end
  end
end
