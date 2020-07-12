# Exercise: MoreCoolStuff-2

The function `Float.parse` converts leading characters of a string to a float, returning either a tuple containing the value and the rest of the string, or the atom `:error`.  

Update your CSV sigil so that numbers are automatically converted:
```elixir
csv = ~v"""
1,2,3.14
cat,dog
"""
```

should generate `[[1.0,2.0,3.14], ["cat","dog"]]`.

## Answer

See source code at [`./exercise-more-cool-stuff-2.exs`](./exercise-more-cool-stuff-2.exs)
```
❯ elixir exercise-more-cool-stuff-2.exs
[[1.0, 2.0, 3.14], ["cat", "dog"]]
```

Pretty cool, huh?
