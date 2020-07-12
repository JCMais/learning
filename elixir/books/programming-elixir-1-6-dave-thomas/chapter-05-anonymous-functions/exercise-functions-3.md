# Exercise: Functions-3

The operator `rem(a, b)` returns the remainder after dividing `a` by `b`. Write a function that takes a single integer `n` and calls the function in the previous exercise, passing it `rem(n,3)`, `rem(n,5)`, and `n`. Call it seven times with the arguments `10`, `11`, `12`, and so on. You should get:
> Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.

Yes, it’s a FizzBuzz (http://c2.com/cgi/wiki?FizzBuzzTest) solution with no conditional logic

## Answer

See source code at [`./exercise-functions-3.exs`](./exercise-functions-3.exs)
```
❯ elixir ./exercise-functions-3.exs
Buzz
11
Fizz
13
14
FizzBuzz
16
```
