# Exercise: ModulesAndFunctions-5

Write a function `gcd(x,y)` that finds the greatest common divisor between two nonnegative integers.  Algebraically, `gcd(x,y)` is `x` if `y` is `0`; it’s `gcd(y, rem(x,y))` otherwise.

## Answer

See source code at [`./exercise-modules-and-functions-5.exs`](./exercise-modules-and-functions-5.exs)
```
❯ iex ./exercise-modules-and-functions-5.exs
Erlang/OTP 23 [erts-11.0.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Gcd.gcd(5, 15)
5
iex(2)> Gcd.gcd(2, 6) 
2
iex(3)> Gcd.gcd(4, 12)
4
```
