## Exercise: WorkingWithMultipleProcesses-3

Use `spawn_link` to start a process, and have that process send a message to the parent and then exit immediately. Meanwhile, sleep for 500 ms in the parent, then receive as many messages as are waiting. Trace what you receive. Does it matter that you weren’t waiting for the notification from the child when it exited?

### Answer

See source code at [`./exercise-working-with-multiple-processes-3.exs`](./exercise-working-with-multiple-processes-3.exs)

It does not matter that we weren't waiting for the notification. The process exits anyway.
```
❯ elixir -r exercise-working-with-multiple-processes-3.exs -e "ExerciseWorkingWithMultipleProcesses3.run"     
** (EXIT from #PID<0.94.0>) :boom
```
