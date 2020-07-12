defmodule ExerciseWorkingWithMultipleProcesses5 do
  @moduledoc """
  Q: (Based on the previous exercise)
      Repeat the two, changing spawn_link to spawn_monitor.
  A: Running run_exit:
      ❯ elixir -r exercise-working-with-multiple-processes-5.exs -e "ExerciseWorkingWithMultipleProcesses5.run_exit"
      -> received message: :ok
      -> received message: {:DOWN, #Reference<0.2421562592.2984509444.78775>, :process, #PID<0.100.0>, :boom}
      - stopped receiving messages
     
     Running run_raise:
      ❯ elixir -r exercise-working-with-multiple-processes-5.exs -e "ExerciseWorkingWithMultipleProcesses5.run_raise"

      12:14:55.382 [error] Process #PID<0.100.0> raised an exception
      ** (RuntimeError) Bye World!
          exercise-working-with-multiple-processes-5.exs:16: ExerciseWorkingWithMultipleProcesses5.child_process_raise/1
      -> received message: :ok
      -> received message: {:DOWN, #Reference<0.58542630.1643118593.6793>, :process, #PID<0.100.0>, {%RuntimeError{message: "Bye World!"}, [{ExerciseWorkingWithMultipleProcesses5, :child_process_raise, 1, [file: 'exercise-working-with-multiple-processes-5.exs', line: 16]}]}}
      - stopped receiving messages
      
     As we can see, by using spawn_monitor the parent process receives all messages correctly.
     When the child process raises an exception, Elixir shows an error message, but that does not
      kill the parent process.
  """

  def child_process_exit(pid) do
    send(pid, :ok)
    exit(:boom)
  end

  def child_process_raise(pid) do
    send(pid, :ok)
    raise("Bye World!")
  end

  def run_exit() do
    spawn_monitor(ExerciseWorkingWithMultipleProcesses5, :child_process_exit, [self()])
    :timer.sleep(500)

    listen_all_messages()
  end

  def run_raise() do
    spawn_monitor(ExerciseWorkingWithMultipleProcesses5, :child_process_raise, [self()])
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
