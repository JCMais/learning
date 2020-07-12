defmodule ExerciseWorkingWithMultipleProcesses8 do
  @moduledoc """
  Q: Run the Fibonacci code on your machine. Do you get comparable timings? If
      your machine has multiple cores and/or processors, do you see improvements
      in the timing as we increase the application’s concurrency?
  A: Output from running 9-fib.ex:
      [{37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}]

      # time (s)
      1 39.19
      2 22.47
      3 14.25
      4 10.88
      5 10.19
      6 11.84
      7 10.21
      8 10.15
      9 10.12
      10 10.16
    This was run on a Quad-Core MacBook Pro, and as we can see, after having
     4 processes in parallel, the performance stays consistent.
  """
end
