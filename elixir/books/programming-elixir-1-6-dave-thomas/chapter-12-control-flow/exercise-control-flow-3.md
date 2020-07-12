## Exercise: ControlFlow-3

Many built-in functions have two forms. The `xxx` form returns the tuple `{:ok, data}` and the `xxx!` form returns data on success but raises an exception  otherwise. However, some functions don’t have the `xxx!` form.

Write an `ok!` function that takes an arbitrary parameter. If the parameter is the tuple `{:ok, data}`, return the data. Otherwise, raise an exception containing information from the parameter.

You could use your function like this:
```elixir
file = ok! File.open("somefile")
```

### Answer
```elixir
defmodule ExerciseControlFlow3 do
  def ok!({:ok, data}), do: data
  def ok!({_, error}), do: raise("Something went wrong: #{error}")

  def run() do
    data = ok!({:ok, %{isTrue: true}})
    IO.inspect(data)
    data = ok!({:error, "enoent"})
  end
end
```
