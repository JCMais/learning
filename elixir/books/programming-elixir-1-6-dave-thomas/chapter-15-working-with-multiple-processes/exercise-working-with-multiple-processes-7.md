## Exercise: WorkingWithMultipleProcesses-7

Change the `^pid` in pmap to `_pid`. This means the receive block will take responses in the order the processes send them. Now run the code again. Do you see any difference in the output? If you’re like me, you don’t, but the program clearly contains a bug.

Are you scared by this? Can you find a way to reveal the problem (perhaps by passing in a different function, by sleeping, or by increasing the number of processes)?

Change it back to ^pid and make sure the order is now correct.

### Answer

See source code at [`./exercise-working-with-multiple-processes-7.exs`](./exercise-working-with-multiple-processes-7.exs)

```
❯ elixir -r exercise-working-with-multiple-processes-7.exs -e "ExerciseWorkingWithMultipleProcesses7.run"
[20, 6, 2, 18, 12, 10, 14, 16, 8, 4]
[2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```
