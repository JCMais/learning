# Exercise: StringsAndBinaries-1
Write a function that returns `true` if a single-quoted string contains only printable ASCII characters (space through tilde).

## Answer

See source code at [`./exercise-strings-and-binaries-1.exs`](./exercise-strings-and-binaries-1.exs)

```
❯ elixir ./exercise-strings-and-binaries-1.exs
ExerciseStringsAndBinaries1.only_printable?('abcdef')
true
ExerciseStringsAndBinaries1.only_printable?('zyxwv')
true
ExerciseStringsAndBinaries1.only_printable?('abe∂gd')
false
```
