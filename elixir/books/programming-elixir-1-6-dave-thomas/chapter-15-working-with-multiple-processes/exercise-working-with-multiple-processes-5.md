## Exercise: WorkingWithMultipleProcesses-5

Repeat the two, changing `spawn_link` to `spawn_monitor`.

### Answer

See source code at [`./exercise-working-with-multiple-processes-5.exs`](./exercise-working-with-multiple-processes-5.exs)

Using `exit`:
```
❯ elixir -r exercise-working-with-multiple-processes-5.exs -e "ExerciseWorkingWithMultipleProcesses5.run_exit"
-> received message: :ok
-> received message: {:DOWN, #Reference<0.3735168859.2090074114.194057>, :process, #PID<0.100.0>, :boom}
- stopped receiving messages
```

Using `raise`:
```
❯ elixir -r exercise-working-with-multiple-processes-5.exs -e "ExerciseWorkingWithMultipleProcesses5.run_raise"

17:34:54.752 [error] Process #PID<0.100.0> raised an exception
** (RuntimeError) Bye World!
    exercise-working-with-multiple-processes-5.exs:33: ExerciseWorkingWithMultipleProcesses5.child_process_raise/1
-> received message: :ok
-> received message: {:DOWN, #Reference<0.1038428109.3700686852.16983>, :process, #PID<0.100.0>, {%RuntimeError{message: "Bye World!"}, [{ExerciseWorkingWithMultipleProcesses5, :child_process_raise, 1, [file: 'exercise-working-with-multiple-processes-5.exs', line: 33]}]}}
- stopped receiving messages
```

As we can see, by using `spawn_monitor` the parent process receives all messages correctly. When the child process raises an exception, Elixir shows an error message, but that does not kill the parent process.
