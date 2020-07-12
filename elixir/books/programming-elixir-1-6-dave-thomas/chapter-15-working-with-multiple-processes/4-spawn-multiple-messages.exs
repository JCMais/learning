defmodule SpawnMultipleMessages do
  def greet do
    # This will wait for multiple messages
    #  as we have a recursive call to greet again inside the receive
    # This does not causes a stack overflow as Elixir implements the so called
    #  tail-call optimization -> If the last thing a function does is call itself, the runtime
    #  simply jumps back to the start of the function and replaces the stack with the new call.
    receive do
      # sender is a PID of the caller
      {sender, msg} ->
        send(sender, {:ok, "Hello, #{msg}"})
        greet()
    end
  end

  def run do
    pid = spawn(SpawnMultipleMessages, :greet, [])
    # the second param passed to send is called term, in our case, it's a tuple
    # self() returns the PID of the running process
    send(pid, {self(), "World!"})

    receive do
      {:ok, message} ->
        IO.puts(message)
    end

    # if we try again, it will work!
    send(pid, {self(), "Kermit!"})

    receive do
      {:ok, message} ->
        IO.puts(message)
    end
  end
end
