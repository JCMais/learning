# Exercise: ListsAndRecursion-3

An Elixir single-quoted string is actually a list of individual character codes. Write a `caesar(list, n)` function that adds `n` to each list element, wrapping if the addition results in a character greater than `z`.
```elixir
iex> MyList.caesar('ryvkve', 13)
?????? :)
```

## Answer

See source code at [`./exercise-lists-and-recursion-3.exs`](./exercise-lists-and-recursion-3.exs)
```
❯ iex ./exercise-lists-and-recursion-3.exs
Erlang/OTP 23 [erts-11.0.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> MyList.caesar('ryvkve', 13)
'elixir'
```
