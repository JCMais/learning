## Exercise: ControlFlow-1

Rewrite the `FizzBuzz` example using `case`.

### Answer
```elixir
  defp fizzbuzz_case(n) do
    case {rem(n, 3), rem(n, 5)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      {_, _} -> n
    end
  end
```

## Exercise: ControlFlow-2

We now have three different implementations of `FizzBuzz`. One uses `cond`, one uses `case`, and one uses separate functions with guard clauses.

Take a minute to look at all three. Which do you feel best expresses the problem. Which will be easiest to maintain?

The `case` style and the implementation using guard clauses are different from control structures in most other languages. If you feel that one of these was the best implementation, can you think of ways to remind
yourself to investigate these options as you write Elixir code in the future?

### Answer

The easiest to maintain are going to be the ones that use pattern matching, which are going to be the implementations with `case` and the one with multiple function calls.

The keyword here is `pattern match`
