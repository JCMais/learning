defmodule Duper.Gatherer do
  use GenServer

  @me __MODULE__

  #########
  # Client
  #########
  def start_link(initial_worker_count) do
    GenServer.start_link(__MODULE__, initial_worker_count, name: @me)
  end

  def report_done() do
    GenServer.cast(@me, {:report_done})
  end

  def report_result(path, hash) do
    GenServer.cast(@me, {:report_result, {path, hash}})
  end

  #########
  # Server
  #########

  def init(worker_count) do
    Process.send_after(self(), {:start}, 0)
    {:ok, worker_count}
  end

  def handle_info({:start}, worker_count) do
    1..worker_count
    |> Enum.each(fn _ -> Duper.WorkerSupervisor.add_worker() end)

    {:noreply, worker_count}
  end

  def handle_cast({:report_done}, _worker_count = 1) do
    report_results()
    System.halt(0)
  end

  def handle_cast({:report_done}, worker_count) do
    {:noreply, worker_count - 1}
  end

  def handle_cast({:report_result, {path, hash}}, worker_count) do
    Duper.Results.add_hash_for_path(path, hash)
    {:noreply, worker_count}
  end

  defp report_results() do
    IO.puts("Results:\n")

    Duper.Results.find_duplicated_files()
    |> Enum.each(&IO.inspect/1)
  end
end
