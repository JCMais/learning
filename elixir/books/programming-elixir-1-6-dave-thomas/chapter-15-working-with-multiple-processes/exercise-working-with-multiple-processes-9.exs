defmodule ExerciseWorkingWithMultipleProcesses9 do
  def run() do
    files = Path.wildcard("./chapter-15/exercise-working-with-multiple-processes-9/file-*.txt")

    Enum.each(1..10, fn num_processes ->
      {time, result} =
        :timer.tc(
          Scheduler,
          :run,
          [num_processes, CatCounterSolver, :cat_counter, files]
        )

      result_total = result |> Enum.reduce(0, fn {_, cats_found}, acc -> acc + cats_found end)

      if num_processes == 1 do
        IO.puts(inspect(result))
        IO.puts(inspect(result_total))
        IO.puts("\n # time (s)")
      end

      :io.format("~2B ~.2f~n", [num_processes, time / 1_000_000.0])
    end)
  end
end

defmodule CatCounterSolver do
  def cat_counter(scheduler) do
    send(scheduler, {:ready, self()})

    receive do
      {:work, file_path, client} ->
        send(client, {:answer, file_path, cats_amount(file_path), self()})
        cat_counter(scheduler)

      {:shutdown} ->
        exit(:normal)
    end
  end

  defp cats_amount(file_path) do
    file_path |> File.read!() |> String.split("cat") |> length() |> (fn len -> len - 1 end).()
  end
end

defmodule Scheduler do
  def run(num_processes, module, func, input_queue) do
    1..num_processes
    |> Enum.map(fn _ ->
      spawn(module, func, [self()])
    end)
    |> schedule_processes(input_queue, [])
  end

  defp schedule_processes(processes, input_queue, results) do
    receive do
      {:ready, pid} when input_queue != [] ->
        [next | tail] = input_queue
        send(pid, {:work, next, self()})
        schedule_processes(processes, tail, results)

      {:ready, pid} ->
        send(pid, {:shutdown})

        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), input_queue, results)
        else
          results
        end

      {:answer, input, output, _pid} ->
        schedule_processes(processes, input_queue, [{input, output} | results])
    end
  end
end

ExerciseWorkingWithMultipleProcesses9.run()
