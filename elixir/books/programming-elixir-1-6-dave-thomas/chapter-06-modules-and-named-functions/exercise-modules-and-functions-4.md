# Exercise: ModulesAndFunctions-4

Implement and run a function `sum(n)` that uses recursion to calculate the sum of the integers from `1` to `n`. You’ll need to write this function inside a module in a separate file. Then load up IEx, compile that file, and try your function.

## Answer

See source code at [`./exercise-modules-and-functions-4.exs`](./exercise-modules-and-functions-4.exs)
```
❯ iex ./exercise-modules-and-functions-4.exs
Erlang/OTP 23 [erts-11.0.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Sum.sum(10)
55
iex(2)> Sum.sum(2) 
3
iex(3)> Sum.sum(5)
15
```
