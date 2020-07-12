# Exercise: StringsAndBinaries-6

Write a function to capitalize the sentences in a string. Each sentence is terminated by a period and a space. Right now, the case of the characters in the string is random.
```
iex> capitalize_sentences("oh. a DOG. woof. ")
"Oh. A dog. Woof. "
```

## Answer

See source code at [`./exercise-strings-and-binaries-6.exs`](./exercise-strings-and-binaries-6.exs)

```
❯ elixir ./exercise-strings-and-binaries-6.exs
ExerciseStringsAndBinaries6.capitalize("...")
"..."
ExerciseStringsAndBinaries6.capitalize("oh. a DOG. woof. ")
"Oh. A dog. Woof. "
ExerciseStringsAndBinaries6.capitalize("oh.  a DOG. woof. ")
"Oh.  A dog. Woof. "
```
