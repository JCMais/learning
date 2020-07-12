# Exercise: StringsAndBinaries-4

(Hard) Write a function that takes a single-quoted string of the form `number [+-*/] number` and returns the result of the calculation. The individual numbers do not have leading plus or minus sign.
```elixir
calculate('123 + 27') # => 150
```

## Answer

See source code at [`./exercise-strings-and-binaries-4.exs`](./exercise-strings-and-binaries-4.exs)

```
❯ elixir ./exercise-strings-and-binaries-4.exs
ExerciseStringsAndBinaries4.calculate('4+4')
8
ExerciseStringsAndBinaries4.calculate('288+2')
290
ExerciseStringsAndBinaries4.calculate('150/2')
75.0
ExerciseStringsAndBinaries4.calculate('300-2')
298
ExerciseStringsAndBinaries4.calculate('310*2')
620
```
