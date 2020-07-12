# This only works if running from elixir directly (not IEx)
# To run: elixir -r 7-spawn-monitor.ex -e "SpawnMonitor.run"
defmodule SpawnMonitor do
  def sad_function do
    :timer.sleep(500)
    exit(:boom)
  end

  def run do
    res = spawn_monitor(SpawnMonitor, :sad_function, [])
    # {#PID<0.100.0>, #Reference<0.2352897932.2982150149.101416>}
    IO.puts(inspect(res))

    receive do
      # -> received msg: {:DOWN, #Reference<0.2352897932.2982150149.101416>, :process, #PID<0.100.0>, :boom}
      msg -> IO.puts("-> received msg: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("-> nothing happened as far as I am concerned")
    end
  end
end
