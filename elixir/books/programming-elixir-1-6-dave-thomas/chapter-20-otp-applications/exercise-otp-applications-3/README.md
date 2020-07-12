# Exercise: OTP-Applications-3

Our boss notices that after we applied our version-0-to-version-1 code change, the delta indeed works as specified. However, she also notices that if the server crashes, the delta is forgotten—only the current number is retained. Create a new release that stashes both values.

## Answer
```
iex(1)> Sequence.Server.get_next_number
"The next number is 456"
iex(2)> Sequence.Server.get_next_number
"The next number is 457"
iex(3)> Sequence.Server.get_next_number
"The next number is 458"
iex(4)> Sequence.Server.increment_number 10
:ok
iex(5)> Sequence.Server.get_next_number    
"The next number is 459"
iex(6)> Sequence.Server.get_next_number
"The next number is 469"
iex(7)> Sequence.Server.get_next_number
"The next number is 479"
iex(8)> Sequence.Server.get_next_number
"The next number is 489"
iex(9)> Sequence.Server.increment_number "abc"
:ok
iex(10)> Sequence.Server.get_next_number       
-- terminate called --
reason: {:badarith, [{:erlang, :+, [499, "abc"], []}, {Sequence.Server, :handle_call, 3, [file: 'lib/sequence/server.ex', line: 36]}, {:gen_server, :try_handle_call, 4, [file: 'gen_server.erl', line: 706]}, {:gen_server, :handle_msg, 6, [file: 'gen_server.erl', line: 735]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 226]}]}
current state: %Sequence.Server.State{current_number: 499, delta: "abc"}

09:41:27.522 [error] GenServer Sequence.Server terminating
** (ArithmeticError) bad argument in arithmetic expression
    :erlang.+(499, "abc")
    (sequence 0.2.0) lib/sequence/server.ex:36: Sequence.Server.handle_call/3
    (stdlib 3.13) gen_server.erl:706: :gen_server.try_handle_call/4
    (stdlib 3.13) gen_server.erl:735: :gen_server.handle_msg/6
    (stdlib 3.13) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
Last message (from #PID<0.215.0>): :next_number
State: %Sequence.Server.State{current_number: 499, delta: "abc"}
Client #PID<0.215.0> is alive

    (stdlib 3.13) gen.erl:208: :gen.do_call/4
    (elixir 1.10.3) lib/gen_server.ex:1020: GenServer.call/3
    (sequence 0.2.0) lib/sequence/server.ex:18: Sequence.Server.get_next_number/0
    (stdlib 3.13) erl_eval.erl:680: :erl_eval.do_apply/6
    (elixir 1.10.3) src/elixir.erl:278: :elixir.recur_eval/3
    (elixir 1.10.3) src/elixir.erl:263: :elixir.eval_forms/3
    (iex 1.10.3) lib/iex/evaluator.ex:258: IEx.Evaluator.handle_eval/5
    (iex 1.10.3) lib/iex/evaluator.ex:239: IEx.Evaluator.do_eval/3
** (exit) exited in: GenServer.call(Sequence.Server, :next_number, 5000)
    ** (EXIT) an exception was raised:
        ** (ArithmeticError) bad argument in arithmetic expression
            :erlang.+(499, "abc")
            (sequence 0.2.0) lib/sequence/server.ex:36: Sequence.Server.handle_call/3
            (stdlib 3.13) gen_server.erl:706: :gen_server.try_handle_call/4
            (stdlib 3.13) gen_server.erl:735: :gen_server.handle_msg/6
            (stdlib 3.13) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
    (elixir 1.10.3) lib/gen_server.ex:1023: GenServer.call/3
    (sequence 0.2.0) lib/sequence/server.ex:18: Sequence.Server.get_next_number/0
iex(10)> Sequence.Server.get_next_number       
-- terminate called --
reason: {:badarith, [{:erlang, :+, [499, "abc"], []}, {Sequence.Server, :handle_call, 3, [file: 'lib/sequence/server.ex', line: 36]}, {:gen_server, :try_handle_call, 4, [file: 'gen_server.erl', line: 706]}, {:gen_server, :handle_msg, 6, [file: 'gen_server.erl', line: 735]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 226]}]}
current state: %Sequence.Server.State{current_number: 499, delta: "abc"}

09:41:31.580 [error] GenServer Sequence.Server terminating
** (ArithmeticError) bad argument in arithmetic expression
    :erlang.+(499, "abc")
    (sequence 0.2.0) lib/sequence/server.ex:36: Sequence.Server.handle_call/3
    (stdlib 3.13) gen_server.erl:706: :gen_server.try_handle_call/4
    (stdlib 3.13) gen_server.erl:735: :gen_server.handle_msg/6
    (stdlib 3.13) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
Last message (from #PID<0.215.0>): :next_number
State: %Sequence.Server.State{current_number: 499, delta: "abc"}
Client #PID<0.215.0> is alive

    (stdlib 3.13) gen.erl:208: :gen.do_call/4
    (elixir 1.10.3) lib/gen_server.ex:1020: GenServer.call/3
    (sequence 0.2.0) lib/sequence/server.ex:18: Sequence.Server.get_next_number/0
    (stdlib 3.13) erl_eval.erl:680: :erl_eval.do_apply/6
    (elixir 1.10.3) src/elixir.erl:278: :elixir.recur_eval/3
    (elixir 1.10.3) src/elixir.erl:263: :elixir.eval_forms/3
    (iex 1.10.3) lib/iex/evaluator.ex:258: IEx.Evaluator.handle_eval/5
    (iex 1.10.3) lib/iex/evaluator.ex:239: IEx.Evaluator.do_eval/3
** (exit) exited in: GenServer.call(Sequence.Server, :next_number, 5000)
    ** (EXIT) an exception was raised:
        ** (ArithmeticError) bad argument in arithmetic expression
            :erlang.+(499, "abc")
            (sequence 0.2.0) lib/sequence/server.ex:36: Sequence.Server.handle_call/3
            (stdlib 3.13) gen_server.erl:706: :gen_server.try_handle_call/4
            (stdlib 3.13) gen_server.erl:735: :gen_server.handle_msg/6
            (stdlib 3.13) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
    (elixir 1.10.3) lib/gen_server.ex:1023: GenServer.call/3
    (sequence 0.2.0) lib/sequence/server.ex:18: Sequence.Server.get_next_number/0
iex(10)> Sequence.Server.increment_number 1    
:ok
iex(11)> Sequence.Server.get_next_number   
"The next number is 499"
iex(12)> Sequence.Server.get_next_number
"The next number is 500"
iex(13)> Sequence.Server.get_next_number
"The next number is 501"
```
