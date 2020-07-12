# Exercises: OTP-Servers-3, OTP-Servers-4 and OTP-Servers-5

## Exercise: OTP-Servers-3

Give your stack server process a name, and make sure it is accessible by
that name in IEx.

### Answer

Done, can be tested by using the server module name instead of a PID:
```
iex(1)> Stacker.Server.start_link([10])
{:ok, #PID<0.152.0>}
iex(2)> GenServer.cast(Stacker.Server, {:push, "abc"})
:ok
```

## Exercise: OTP-Servers-4

Add the API to your stack module (the functions that wrap the `GenServer` calls)

### Answer

This was done already:
```
iex(1)> Stacker.Server.start_link([10])
{:ok, #PID<0.152.0>}
iex(2)> Stacker.Server.push("abc")
:ok
iex(3)> Stacker.Server.pop 
"abc"
```

## Exercise: OTP-Servers-5
Implement the `terminate` callback in your stack handler.
Use `IO.puts` to report the arguments it receives.

### Answer

> using `:sys.terminate`
```
iex(1)> Stacker.Server.start_link([10])
{:ok, #PID<0.152.0>}
iex(2)> :sys.terminate Stacker.Server, :error 
:ok
-- terminate called --
reason: error
current state: 10
```

> using the randomness of :push
```
iex(1)> Stacker.Server.start_link([10])
{:ok, #PID<0.192.0>}
iex(2)> Stacker.Server.push "a"
... some pushes later ...
iex(4)> Stacker.Server.push "c
-- terminate called --
reason: :randomness
current state: ["b", "a", 10]

:ok
** (EXIT from #PID<0.190.0>) shell process exited with reason: :randomness
iex(27)>
18:33:55.636 [error] GenServer Stacker.Server terminating
** (stop) :randomness
Last message: {:"$gen_cast", {:push, "c"}}
State: ["b", "a", 10]
```

> using System.halt(n) when push value < 10
```
iex(1)> Stacker.Server.start_link([10])
{:ok, #PID<0.152.0>}
iex(2)> Stacker.Server.push(2)
%
```

As the `GenServer` process is linked to the current process, `System.halt` ends the iEX session even before terminate is called.
