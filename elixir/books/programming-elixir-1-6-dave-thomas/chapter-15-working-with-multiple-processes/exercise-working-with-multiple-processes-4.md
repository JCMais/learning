## Exercise: WorkingWithMultipleProcesses-4

Do the same, but have the child raise an exception. What difference do you see in the tracing?

### Answer

See source code at [`./exercise-working-with-multiple-processes-4.exs`](./exercise-working-with-multiple-processes-4.exs)

The only difference is that the exit message contains the exception that was raised:
```
❯ elixir -r exercise-working-with-multiple-processes-4.exs -e "ExerciseWorkingWithMultipleProcesses4.run"
** (EXIT from #PID<0.94.0>) an exception was raised:
    ** (RuntimeError) Bye World!
        exercise-working-with-multiple-processes-4.exs:15: ExerciseWorkingWithMultipleProcesses4.child_process/1
```
