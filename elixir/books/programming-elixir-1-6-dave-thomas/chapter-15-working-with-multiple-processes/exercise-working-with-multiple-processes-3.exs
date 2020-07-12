defmodule ExerciseWorkingWithMultipleProcesses3 do
  def child_process(pid) do
    send(pid, :ok)
    exit(:boom)
  end

  def run() do
    spawn_link(ExerciseWorkingWithMultipleProcesses3, :child_process, [self()])
    :timer.sleep(500)

    listen_all_messages()
  end

  def listen_all_messages() do
    receive do
      msg ->
        IO.puts("-> received message: #{inspect(msg)}")
        listen_all_messages()
    after
      1000 ->
        IO.puts("- stopped receiving messages")
    end
  end
end
