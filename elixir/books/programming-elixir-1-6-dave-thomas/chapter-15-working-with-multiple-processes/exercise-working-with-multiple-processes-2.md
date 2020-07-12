## Exercise: WorkingWithMultipleProcesses-2

Write a program that spawns two processes and then passes each a unique token (for example, `“fred”` and `“betty”`). Have them send the tokens back.

- Is the order in which the replies are received deterministic in theory? In practice?
- If either answer is no, how could you make it so?

### Answer

See source code at [`./exercise-working-with-multiple-processes-2.exs`](./exercise-working-with-multiple-processes-2.exs)

#### Is the order in which the replies are received deterministic in theory? In practice?

In practice, running this locally the order is consistently the same. We receive `"fred"` first and `"betty"` after.

```
❯ elixir -r exercise-working-with-multiple-processes-2.exs -e "ExerciseWorkingWithMultipleProcesses2.run"       
1- Received back token fred
2- Received back token betty
```

But this is not deterministic, we can show that by having the first process send the message back only after some delay:
```
❯ elixir -r exercise-working-with-multiple-processes-2.exs -e "ExerciseWorkingWithMultipleProcesses2.run_botched"
1- Received back token betty
2- Received back token fred
```

#### If either answer is no, how could you make it so?

This is possible be waiting for the first message to arrive before sending the next:
```
❯ elixir -r exercise-working-with-multiple-processes-2.exs -e "ExerciseWorkingWithMultipleProcesses2.run_ordered"
|> received token fred
|> received token betty
- ended
```
