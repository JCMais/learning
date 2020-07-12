defmodule SpawnLinking3 do
  def sad_function do
    :timer.sleep(500)
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(SpawnLinking3, :sad_function, [])

    receive do
      # -> received msg: {:EXIT, #PID<0.149.0>, :boom}
      msg -> IO.puts("-> received msg: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("-> nothing happened as far as I am concerned")
    end
  end
end
