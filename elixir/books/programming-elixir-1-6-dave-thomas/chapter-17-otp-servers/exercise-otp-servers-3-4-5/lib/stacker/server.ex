defmodule Stacker.Server do
  use GenServer

  # Client

  def start_link(default, options \\ []) when is_list(default) do
    GenServer.start_link(__MODULE__, default, [name: __MODULE__] ++ options)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(value) do
    GenServer.cast(__MODULE__, {:push, value})
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
    # will return stop ~20% of the time
    case {value, :random.uniform()} do
      {value, _} when is_integer(value) and value < 10 -> System.halt(value)
      {value, n} when n < 0.8 -> {:noreply, [value | list]}
      _ -> {:stop, :randomness, list}
    end
  end

  @impl true
  def terminate(reason, state) do
    IO.puts(
      "-- terminate called --\nreason: #{inspect(reason)}\ncurrent state: #{inspect(state)}"
    )
  end
end
