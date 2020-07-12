defmodule Duper.Worker do
  # This worker should not be restarted when it
  #  stops gracefully
  use GenServer, restart: :transient

  def start_link(_) do
    # As these are created dynamically by the WorkerSupervisor we cannot name them
    GenServer.start_link(__MODULE__, :no_args)
  end

  def init(:no_args) do
    Process.send_after(self(), {:do_one_file}, 0)
    {:ok, nil}
  end

  def handle_info({:do_one_file}, _) do
    Duper.PathFinder.next_path()
    |> add_result()
  end

  # When we receive nil from next_path
  #  it means we are done and we should stop this worker
  defp add_result(nil) do
    Duper.Gatherer.report_done()
    {:stop, :normal, nil}
  end

  # When we receive a path, let's handle
  #  and right after be available for another file
  defp add_result(path) do
    Duper.Gatherer.report_result(path, hash_of_file_at(path))
    send(self(), {:do_one_file})
    {:noreply, nil}
  end

  defp hash_of_file_at(path) do
    File.stream!(path, [], 1024 * 1024)
    |> Enum.reduce(
      :crypto.hash_init(:md5),
      fn block, hash -> :crypto.hash_update(hash, block) end
    )
    |> :crypto.hash_final()
  end
end
