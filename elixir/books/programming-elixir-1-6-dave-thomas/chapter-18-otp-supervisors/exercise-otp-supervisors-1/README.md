# Exercise: OTP-Supervisors-1

Add a supervisor to your stack application. Use IEx to make sure it starts the server correctly. Use the server normally, and then crash it (try popping from an empty stack).

Did it restart? What were the stack contents after the restart?

## Answer

```
iex(1)> Stacker.Server.push("a")
:ok
iex(2)> Stacker.Server.pop
"a"
iex(3)> Stacker.Server.pop
-- terminate called --
reason: {:function_clause, [{Stacker.Server, :handle_call, [:pop, {#PID<0.179.0>, #Reference<0.3873043163.3895721987.56174>}, []], [file: 'lib/stacker/server.ex', line: 27]}, 
{:gen_server, :try_handle_call, 4, [file: 'gen_server.erl', line: 706]}, {:gen_server, :handle_msg, 6, [file: 'gen_server.erl', line: 735]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 226]}]}
current state: []

19:04:49.452 [error] GenServer Stacker.Server terminating
** (FunctionClauseError) no function clause matching in Stacker.Server.handle_call/3
    (stacker 0.1.0) lib/stacker/server.ex:27: Stacker.Server.handle_call(:pop, {#PID<0.179.0>, #Reference<0.3873043163.3895721987.56174>}, [])
    (stdlib 3.13) gen_server.erl:706: :gen_server.try_handle_call/4
    (stdlib 3.13) gen_server.erl:735: :gen_server.handle_msg/6
    (stdlib 3.13) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
Last message (from #PID<0.179.0>): :pop
State: []
Client #PID<0.179.0> is alive

    (stdlib 3.13) gen.erl:208: :gen.do_call/4
    (elixir 1.10.3) lib/gen_server.ex:1020: GenServer.call/3
    (stdlib 3.13) erl_eval.erl:680: :erl_eval.do_apply/6
    (elixir 1.10.3) src/elixir.erl:278: :elixir.recur_eval/3
    (elixir 1.10.3) src/elixir.erl:263: :elixir.eval_forms/3
    (iex 1.10.3) lib/iex/evaluator.ex:258: IEx.Evaluator.handle_eval/5
    (iex 1.10.3) lib/iex/evaluator.ex:239: IEx.Evaluator.do_eval/3
    (iex 1.10.3) lib/iex/evaluator.ex:217: IEx.Evaluator.eval/3
** (exit) exited in: GenServer.call(Stacker.Server, :pop, 5000)
    ** (EXIT) an exception was raised:
        ** (FunctionClauseError) no function clause matching in Stacker.Server.handle_call/3
            (stacker 0.1.0) lib/stacker/server.ex:27: Stacker.Server.handle_call(:pop, {#PID<0.179.0>, #Reference<0.3873043163.3895721987.56174>}, [])
            (stdlib 3.13) gen_server.erl:706: :gen_server.try_handle_call/4
            (stdlib 3.13) gen_server.erl:735: :gen_server.handle_msg/6
            (stdlib 3.13) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
    (elixir 1.10.3) lib/gen_server.ex:1023: GenServer.call/3
iex(3)> Stacker.Server.push("a")
:ok
iex(4)> Stacker.Server.pop      
"a"
iex(5)> Stacker.Server.pop
-- terminate called --
reason: {:function_clause, [{Stacker.Server, :handle_call, [:pop, {#PID<0.179.0>, #Reference<0.3873043163.3895721986.56248>}, []], [file: 'lib/stacker/server.ex', line: 27]}, 
{:gen_server, :try_handle_call, 4, [file: 'gen_server.erl', line: 706]}, {:gen_server, :handle_msg, 6, [file: 'gen_server.erl', line: 735]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 226]}]}
current state: []
... error again ...
```

As we can see above, the server restarted correctly and the state became the initial state.
