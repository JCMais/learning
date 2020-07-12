defmodule Sequence.Server do
  use GenServer

  # Client

  def start_link(initial_number, options \\ []) when is_integer(initial_number) do
    GenServer.start_link(__MODULE__, initial_number, options)
  end

  def get_next_number(pid) when is_pid(pid) do
    GenServer.call(pid, :next_number)
  end

  def increment_number(pid, delta) when is_pid(pid) and is_integer(delta) do
    GenServer.cast(pid, {:increment_number, delta})
  end

  # Server

  @impl true
  def init(initial_number) do
    {:ok, initial_number}
  end

  @impl true
  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end

  @impl true
  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, current_number + delta}
  end
end
