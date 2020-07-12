defmodule Stacker.Server do
  use GenServer

  # Client

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def pop(pid) when is_pid(pid) do
    GenServer.call(pid, :pop)
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
end
