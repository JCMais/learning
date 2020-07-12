# Exercise: LinkingModules-BehavioursAndUse-2

The built-in module `IO.ANSI` defines functions that represent ANSI escape sequences. You can use it to build output than will display (for example) colors and bold, inverse, or underlined text (assuming the terminal supports it).
```
iex> import IO.ANSI
iex> IO.puts [ "Hello, ", white(), green_background(), "world!"]
Hello, world!
```

Explore the module, and use it to colorize our tracing’s output.

Why does passing a list of strings to `IO.puts` work?

## Answer

Modified trace can be executed by running:
```bash
elixir exercise-linking-modules-behaviours-and-use-2.exs
```

Passing a list of strings to `IO.puts` works because it expects a chardata argument, which per the [documentation](https://hexdocs.pm/elixir/IO.html#module-io-data):

> is a binary or a list containing bytes (integers in 0..255) or nested IO data

As it's recursive (allows for nested IO data), passing a list of binaries works just fine.
