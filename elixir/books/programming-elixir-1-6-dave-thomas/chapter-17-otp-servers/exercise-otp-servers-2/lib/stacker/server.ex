defmodule Stacker.Server do
  use GenServer

  # Client

  def start_link(default, options \\ []) when is_list(default) do
    GenServer.start_link(__MODULE__, default, options)
  end

  def pop(pid) when is_pid(pid) do
    GenServer.call(pid, :pop)
  end

  def push(pid, value) when is_pid(pid) do
    GenServer.cast(pid, {:push, value})
  end

  # Server

  @impl true
  def init(initial_values) do
    {:ok, initial_values}
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
end
