defmodule Duper.Results do
  use GenServer

  @me __MODULE__

  ########
  # Client
  ########
  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args, name: @me)
  end

  def add_hash_for_path(path, hash) do
    GenServer.cast(@me, {:add_hash_path, {path, hash}})
  end

  def find_duplicated_files() do
    GenServer.call(@me, {:find_duplicated_files})
  end

  ########
  # Server
  ########
  def init(:no_args) do
    {:ok, %{}}
  end

  def handle_cast({:add_hash_path, {path, hash}}, state) do
    new_state =
      Map.update(
        # on this map
        state,
        # look for this hash
        hash,
        # if it does not exists, set it to this value
        [path],
        # otherwise update it by running this fun
        fn existing -> [path | existing] end
      )

    {:noreply, new_state}
  end

  def handle_call({:find_duplicated_files}, _from, state) do
    {:reply, get_duplicated_files(state), state}
  end

  defp get_duplicated_files(hash_map) do
    hash_map
    |> Enum.filter(fn {_hash, values} -> length(values) > 1 end)
    |> Enum.map(&elem(&1, 1))
  end
end
