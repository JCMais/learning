defmodule ExerciseWorkingWithMultipleProcesses2 do
  def reply_token() do
    receive do
      {pid, token} -> send(pid, token)
    end
  end

  def reply_token_delay do
    receive do
      {pid, token} ->
        :timer.sleep(2000)
        send(pid, token)
    end
  end

  def run() do
    p1 = spawn(ExerciseWorkingWithMultipleProcesses2, :reply_token, [])
    p2 = spawn(ExerciseWorkingWithMultipleProcesses2, :reply_token, [])

    send(p1, {self(), "fred"})
    send(p2, {self(), "betty"})

    # we could just create a function to receive those, instead of having two calls
    receive do
      token -> IO.puts("1- Received back token #{token}")
    end

    receive do
      token -> IO.puts("2- Received back token #{token}")
    end
  end

  def run_botched() do
    p1 = spawn(ExerciseWorkingWithMultipleProcesses2, :reply_token_delay, [])
    p2 = spawn(ExerciseWorkingWithMultipleProcesses2, :reply_token, [])

    send(p1, {self(), "fred"})
    send(p2, {self(), "betty"})

    # we could just create a function to receive those, instead of having two calls
    receive do
      token -> IO.puts("1- Received back token #{token}")
    end

    receive do
      token -> IO.puts("2- Received back token #{token}")
    end
  end

  def run_ordered() do
    p1 = spawn(ExerciseWorkingWithMultipleProcesses2, :reply_token_delay, [])
    p2 = spawn(ExerciseWorkingWithMultipleProcesses2, :reply_token, [])

    send_and_listen([{p1, "fred"}, {p2, "betty"}])
  end

  def send_and_listen([]) do
    IO.puts("- ended")
  end

  def send_and_listen([{pid, token} | tail]) do
    send(pid, {self(), token})

    receive do
      token ->
        IO.puts("|> received token #{token}")
    end

    send_and_listen(tail)
  end
end
