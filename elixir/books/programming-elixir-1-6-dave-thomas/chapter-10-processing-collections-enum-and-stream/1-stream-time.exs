defmodule Countdown do
  def sleep(seconds) do
    receive do
    after
      seconds * 1000 -> nil
    end
  end

  def say(text) do
    spawn(fn ->
      :os.cmd(
        'echo #{text} | /c/Windows/System32/cscript.exe "D:\\Software\\Jampal\\ptts.vbs" -r 10'
      )
    end)
  end

  def timer do
    Stream.resource(
      fn ->
        {_h, _m, s} = :erlang.time()
        60 - s - 1
      end,
      fn
        0 ->
          {:halt, 0}

        count ->
          sleep(1)
          {[inspect(count)], count - 1}
      end,
      fn _ -> nil end
    )
  end
end

defmodule Test do
  def run do
    counter = Countdown.timer()
    printer = counter |> Stream.each(&IO.puts/1)
    speaker = printer |> Stream.each(&Countdown.say/1)

    speaker |> Enum.take(15)

    # If we wanted it to run to the end:
    # speaker |> Enum.to_list
  end
end
