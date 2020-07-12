# Exercise: ListsAndRecursion-7

In the last exercise of Chapter 7, Lists and Recursion, on page 71, you wrote a span function. Use it and list comprehensions to return a list of the prime numbers from `2` to `n`.

## Answer

See source code at [`./exercise-lists-and-recursion-7.exs`](./exercise-lists-and-recursion-7.exs)

The original span implementation is available at [`../chapter-07-lists-and-recursion/exercise-lists-and-recursion-4.exs`](../chapter-07-lists-and-recursion/exercise-lists-and-recursion-4.exs)

```
❯ iex ./exercise-lists-and-recursion-7.exs
Erlang/OTP 23 [erts-11.0.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> PrimeNumbers.get(1, 100)
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73,
 79, 83, 89, 97]
```
