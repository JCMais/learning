defmodule SpawnLinking2 do
  def sad_function do
    :timer.sleep(500)
    exit(:boom)
  end

  def run do
    spawn_link(SpawnLinking2, :sad_function, [])

    receive do
      msg -> IO.puts("-> received msg: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("-> nothing happened as far as I am concerned")
    end
  end
end
