# Exercise: MoreCoolStuff-1

Write a sigil `~v` that parses multiple lines of comma-separated data, returning a list where each element is a row of data and each row is a list of values. Don’t worry about quoting—just assume each field is separated by a comma.

For example
```elixir
csv = ~v"""
1,2,3
cat,dog
"""
```

would generate `[["1","2","3"], ["cat","dog"]]`.

## Answer

See source code at [`./exercise-more-cool-stuff-1.exs`](./exercise-more-cool-stuff-1.exs)
```
❯ elixir exercise-more-cool-stuff-1.exs
[["1", "2", "3", ""], ["cat", "dog"]]
```
