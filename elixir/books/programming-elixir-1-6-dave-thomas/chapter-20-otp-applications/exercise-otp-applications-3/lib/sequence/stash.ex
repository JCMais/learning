defmodule Sequence.Stash do
  use GenServer

  alias Sequence.Server.State

  @me __MODULE__

  #######
  # Client
  #######
  def start_link(initial_number, options \\ []) do
    GenServer.start_link(__MODULE__, initial_number, [name: @me] ++ options)
  end

  def get(), do: GenServer.call(@me, {:get})
  def set(new_value), do: GenServer.cast(@me, {:set, new_value})

  #######
  # Server
  #######

  def init(initial_number) do
    {:ok, struct!(State, %{current_number: initial_number})}
  end

  def handle_call({:get}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:set, value}, _state) do
    {:noreply, value}
  end
end
