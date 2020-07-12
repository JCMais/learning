# Exercise: OTP-Servers-1

You’re going to start creating a server that implements a stack. The call that
initializes your stack will pass in a list of the initial stack contents.  

For now, implement only the pop interface. It’s acceptable for your server to
crash if someone tries to pop from an empty stack.  

For example, if initialized with `[5,"cat",9]`, successive calls to pop will return
5, "cat", and 9.

## Answer
```
❯ iex -S mix
iex(1)> {:ok, pid} = Stacker.Server.start_link([5, "cat", 9])
{:ok, #PID<0.171.0>}
iex(2)> Stacker.Server.pop pid
5
iex(6)> Stacker.Server.pop pid
"cat"
iex(7)> Stacker.Server.pop pid
9
iex(8)> Stacker.Server.pop pid

11:45:36.006 [error] GenServer #PID<0.171.0> terminating
** (FunctionClauseError) no function clause matching in Stacker.Server.handle_call/3
    (stacker 0.1.0) lib/stacker/server.ex:23: Stacker.Server.handle_call(:pop, {#PID<0.169.0>, #Reference<0.2067163836.2753298433.212440>}, [])
    (stdlib 3.13) gen_server.erl:706: :gen_server.try_handle_call/4
    (stdlib 3.13) gen_server.erl:735: :gen_server.handle_msg/6
    (stdlib 3.13) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
Last message (from #PID<0.169.0>): :pop
State: []
Client #PID<0.169.0> is alive

    (stdlib 3.13) gen.erl:208: :gen.do_call/4
    (elixir 1.10.3) lib/gen_server.ex:1020: GenServer.call/3
    (stdlib 3.13) erl_eval.erl:680: :erl_eval.do_apply/6
    (elixir 1.10.3) src/elixir.erl:278: :elixir.recur_eval/3
    (elixir 1.10.3) src/elixir.erl:263: :elixir.eval_forms/3
    (iex 1.10.3) lib/iex/evaluator.ex:258: IEx.Evaluator.handle_eval/5
    (iex 1.10.3) lib/iex/evaluator.ex:239: IEx.Evaluator.do_eval/3
    (iex 1.10.3) lib/iex/evaluator.ex:217: IEx.Evaluator.eval/3
** (EXIT from #PID<0.169.0>) shell process exited with reason: an exception was raised:
    ** (FunctionClauseError) no function clause matching in Stacker.Server.handle_call/3
        (stacker 0.1.0) lib/stacker/server.ex:23: Stacker.Server.handle_call(:pop, {#PID<0.169.0>, #Reference<0.2067163836.2753298433.212440>}, [])
        (stdlib 3.13) gen_server.erl:706: :gen_server.try_handle_call/4
        (stdlib 3.13) gen_server.erl:735: :gen_server.handle_msg/6
        (stdlib 3.13) proc_lib.erl:226: :proc_lib.init_p_do_apply/3

```
