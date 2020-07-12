defmodule Sequence.Stash do
  use GenServer

  @me __MODULE__

  #######
  # Client
  #######
  def start_link(initial_value, options \\ []) do
    GenServer.start_link(__MODULE__, initial_value, [name: @me] ++ options)
  end

  def get(), do: GenServer.call(@me, {:get})
  def set(new_value), do: GenServer.cast(@me, {:set, new_value})

  #######
  # Server
  #######

  def init(initial_value) do
    {:ok, initial_value}
  end

  def handle_call({:get}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:set, value}, _state) do
    {:noreply, value}
  end
end
