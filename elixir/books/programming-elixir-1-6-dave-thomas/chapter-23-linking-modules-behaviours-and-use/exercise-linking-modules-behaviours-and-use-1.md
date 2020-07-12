# Exercise: LinkingModules-BehavioursAndUse-1

In the body of the def macro, there’s a `quote` block that defines the actual method. It contains:
```elixir
IO.puts "==> call: #{Tracer.dump_dfn(unquote(name), unquote(args))}"
result = unquote(content)
IO.puts "<== result: #{result}"
```

Why does the first call to puts have to `unquote` the values in its interpolation but the second call does not?

## Answer

Because if we called `unquote` again we would be executing the function content two times, which is not expected from someone using our macro. It's recommended to always `unquote` a value only once.
