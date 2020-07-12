defmodule Sequence.Server do
  use GenServer

  @vsn "1"
  @me __MODULE__

  defmodule State do
    defstruct(current_number: 0, delta: 1)
  end

  # Client

  def start_link(_, options \\ []) do
    GenServer.start_link(__MODULE__, nil, [name: @me] ++ options)
  end

  def get_next_number() do
    with number = GenServer.call(@me, :next_number),
      do: "The next number is #{number}"
  end

  def increment_number(delta) do
    GenServer.cast(@me, {:increment_number, delta})
  end

  # Server

  @impl true
  def init(_) do
    state = Sequence.Stash.get()
    {:ok, state}
  end

  @impl true
  def handle_call(:next_number, _from, state = %State{current_number: n}) do
    {:reply, n, %{state | current_number: n + state.delta}}
  end

  @impl true
  def handle_cast({:increment_number, delta}, state) do
    {:noreply, %State{state | delta: delta}}
  end

  @impl true
  def terminate(reason, state) do
    IO.puts(
      "-- terminate called --\nreason: #{inspect(reason)}\ncurrent state: #{inspect(state)}"
    )

    Sequence.Stash.set(state)
  end
end
