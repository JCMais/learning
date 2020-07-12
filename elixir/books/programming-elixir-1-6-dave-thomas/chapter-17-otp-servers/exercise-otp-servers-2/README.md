# Exercise: OTP-Servers-2

Extend your stack server with a push interface that adds a single value to the
top of the stack. This will be implemented as a cast.
Experiment in IEx with pushing and popping values.

## Answer
```
❯ iex -S mix
iex(1)> {:ok, pid} = Stacker.Server.start_link(["a", 5, "b"], debug: [:trace])
{:ok, #PID<0.173.0>}
iex(2)> Stacker.Server.pop(pid)
*DBG* <0.173.0> got call pop from <0.165.0>
*DBG* <0.173.0> sent <<"a">> to <0.165.0>, new state [5,<<"b">>]
"a"
iex(3)> Stacker.Server.pop(pid)        
*DBG* <0.173.0> got call pop from <0.165.0>
*DBG* <0.173.0> sent 5 to <0.165.0>, new state [<<"b">>]
5
iex(4)> Stacker.Server.push(pid, "abc")
*DBG* <0.173.0> got cast {push,<<"abc">>}
:ok
*DBG* <0.173.0> new state [<<"abc">>,<<"b">>]
iex(5)> Stacker.Server.pop(pid)        
*DBG* <0.173.0> got call pop from <0.165.0>
*DBG* <0.173.0> sent <<"abc">> to <0.165.0>, new state [<<"b">>]
"abc"
iex(6)> Stacker.Server.push(pid, 123)  
*DBG* <0.173.0> got cast {push,123}
:ok
*DBG* <0.173.0> new state [123,<<"b">>]
iex(7)> Stacker.Server.push(pid, 456)
*DBG* <0.173.0> got cast {push,456}
:ok
*DBG* <0.173.0> new state [456,123,<<"b">>]
iex(8)> Stacker.Server.pop(pid)      
*DBG* <0.173.0> got call pop from <0.165.0>
*DBG* <0.173.0> sent 456 to <0.165.0>, new state [123,<<"b">>]
456
```
