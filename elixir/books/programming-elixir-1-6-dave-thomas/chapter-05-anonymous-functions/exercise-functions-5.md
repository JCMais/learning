# Exercise: Functions-

Use the & notation to rewrite the following:
- `Enum.map [1,2,3,4], fn x -> x + 2 end`
- `Enum.each [1,2,3,4], fn x -> IO.inspect x end`

## Answer

- `Enum.map [1,2,3,4], fn x -> x + 2 end`
```elixir
Enum.map [1, 2, 3, 4], &(&1 + 2)
```
- `Enum.each [1,2,3,4], fn x -> IO.inspect x end`
```elixir
Enum.each [1,2,3,4], &IO.inspect/1
```
