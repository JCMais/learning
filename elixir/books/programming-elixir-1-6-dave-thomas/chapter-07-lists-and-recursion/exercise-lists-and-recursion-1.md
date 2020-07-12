# Exercise: ListsAndRecursion-1

Write a `mapsum` function that takes a list and a function. It applies the function to each element of the list and then sums the result, so
```elixir
iex> MyList.mapsum [1, 2, 3], &(&1 * &1)
14
```

## Answer

See source code at [`./exercise-lists-and-recursion-1.exs`](./exercise-lists-and-recursion-1.exs)
```
❯ iex ./exercise-lists-and-recursion-1.exs
Erlang/OTP 23 [erts-11.0.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> MyList.mapsum [1, 2, 3], &(&1 * &1)
14
iex(2)> MyList.mapsum [3, 6, 9], &(&1 / 3) 
6.0
iex(3)> MyList.mapsum [3, 6, 9], &div(&1, 3)
6
```
