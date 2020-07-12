defmodule Sequence do
  @server Sequence.Server

  def start_link(initial_number, options \\ []) when is_integer(initial_number) do
    GenServer.start_link(@server, initial_number, [name: @server] ++ options)
  end

  def get_next_number() do
    GenServer.call(@server, :next_number)
  end

  def increment_number(delta) when is_integer(delta) do
    GenServer.cast(@server, {:increment_number, delta})
  end
end
