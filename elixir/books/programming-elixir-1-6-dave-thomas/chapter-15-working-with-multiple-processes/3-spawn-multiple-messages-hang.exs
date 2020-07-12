defmodule SpawnMultipleMessagesHang do
  def greet do
    # This will wait for a SINGLE message, and handle it
    receive do
      # sender is a PID of the caller
      {sender, msg} ->
        send(sender, {:ok, "Hello, #{msg}"})
    end
  end

  def run_hang do
    pid = spawn(SpawnMultipleMessagesHang, :greet, [])
    # the second param passed to send is called term, in our case, it's a tuple
    # self() returns the PID of the running process
    send(pid, {self(), "World!"})

    receive do
      {:ok, message} ->
        IO.puts(message)
    end

    # if we try again, it will hang, and we will have to stop iex using CTRL+C
    send(pid, {self(), "Kermit!"})

    receive do
      {:ok, message} ->
        IO.puts(message)
    end
  end

  def run do
    pid = spawn(SpawnMultipleMessagesHang, :greet, [])
    # the second param passed to send is called term, in our case, it's a tuple
    # self() returns the PID of the running process
    send(pid, {self(), "World!"})

    receive do
      {:ok, message} ->
        IO.puts(message)
    end

    # if we try again, it will hang, and we will have to stop iex using CTRL+C
    send(pid, {self(), "Kermit!"})

    receive do
      {:ok, message} ->
        IO.puts(message)
    after
      500 ->
        IO.puts("The greeter has gone away")
    end
  end
end
