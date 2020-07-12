defmodule Stacker.Server do
  use GenServer

  @me __MODULE__

  # Client

  def start_link(_, options \\ []) do
    GenServer.start_link(@me, nil, [name: @me] ++ options)
  end

  def pop do
    GenServer.call(@me, :pop)
  end

  def push(value) do
    GenServer.cast(@me, {:push, value})
  end

  # Server

  @impl true
  def init(_) do
    {:ok, Stacker.Stash.get()}
  end

  # This will crash if the list is empty
  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, value}, list) do
    {:noreply, [value | list]}
  end

  @impl true
  def terminate(reason, state) do
    IO.puts(
      "-- terminate called --\nreason: #{inspect(reason)}\ncurrent state: #{inspect(state)}"
    )

    Stacker.Stash.set(state)
  end
end
