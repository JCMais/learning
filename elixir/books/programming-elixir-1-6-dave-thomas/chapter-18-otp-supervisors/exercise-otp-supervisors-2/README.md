# Exercise: OTP-Supervisors-2

Rework your stack server to use a supervision tree with a separate stash process to hold the state. Verify that it works and that when you crash the server state is retained across a restart.

## Answer

```
iex(1)> Stacker.Server.push "abc"
:ok
iex(2)> Stacker.Server.push 10   
:ok
iex(3)> Stacker.Server.push 123
:ok
-- terminate called --
reason: :randomness
current state: [10, "abc"]

19:52:13.370 [error] GenServer Stacker.Server terminating
** (stop) :randomness
Last message: {:"$gen_cast", {:push, 123}}
State: [10, "abc"]
iex(4)> Stacker.Server.pop
10
```

Per above, the current state was correctly retrieved from the `Stash` server when the `Stacker` server restarted.
