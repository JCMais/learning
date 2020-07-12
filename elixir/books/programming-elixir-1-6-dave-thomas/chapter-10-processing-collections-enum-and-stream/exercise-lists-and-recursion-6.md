# Exercise: ListsAndRecursion-6

(Hard) Write a `flatten(list)` function that takes a list that may contain any number of sublists, which themselves may contain sublists, to any depth. It returns the elements of these lists as a flat list.
```elixir
iex> MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
[1,2,3,4,5,6]
```

Hint: You may have to use `Enum.reverse` to get your result in the correct order.

## Answer

See source code at [`./exercise-lists-and-recursion-6.exs`](./exercise-lists-and-recursion-6.exs)
```
❯ iex ./exercise-lists-and-recursion-6.exs
Erlang/OTP 23 [erts-11.0.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Test.run
list = [1, [2, 3, [4]], 5, [[[6]]]]
MyList.flatten(list) == [1, 2, 3, 4, 5, 6]
true
```
