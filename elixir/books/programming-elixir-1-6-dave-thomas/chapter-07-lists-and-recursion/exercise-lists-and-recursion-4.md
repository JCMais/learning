# Exercise: ListsAndRecursion-4

Write a function `MyList.span(from, to)` that returns a list of the numbers from `from` up to `to`.

## Answer

See source code at [`./exercise-lists-and-recursion-4.exs`](./exercise-lists-and-recursion-4.exs)
```
❯ iex ./exercise-lists-and-recursion-4.exs
Erlang/OTP 23 [erts-11.0.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> MyList.span(-5, 15)
[15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5]
```
