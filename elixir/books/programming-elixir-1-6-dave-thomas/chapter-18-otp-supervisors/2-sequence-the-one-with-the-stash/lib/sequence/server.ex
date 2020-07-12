defmodule Sequence.Server do
  use GenServer

  # Client

  def start_link(_, options \\ []) do
    GenServer.start_link(__MODULE__, nil, [name: __MODULE__] ++ options)
  end

  def get_next_number() do
    GenServer.call(__MODULE__, :next_number)
  end

  def increment_number(delta) do
    GenServer.cast(__MODULE__, {:increment_number, delta})
  end

  # Server

  @impl true
  def init(_) do
    {:ok, Sequence.Stash.get()}
  end

  @impl true
  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end

  @impl true
  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, current_number + delta}
  end

  @impl true
  def terminate(reason, state) do
    IO.puts(
      "-- terminate called --\nreason: #{inspect(reason)}\ncurrent state: #{inspect(state)}"
    )

    Sequence.Stash.set(state)
  end
end
