defmodule SpawnMessages do
  def greet do
    # This will wait for a SINGLE message, and handle it
    receive do
      # sender is a PID of the caller
      {sender, msg} ->
        send(sender, {:ok, "Hello, #{msg}"})
    end
  end

  def run_hang do
    pid = spawn(SpawnMessages, :greet, [])
    send(pid, {self(), "World!"})

    receive do
      {:ok, message} ->
        IO.puts(message)
    end
  end
end
