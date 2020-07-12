# Exercise: Protocols-4

In many cases, inspect will return a valid Elixir literal for the value being inspected. Update the inspect function for structs so that it returns valid Elixir code to construct a new struct equal to the value being inspected.

## Answer

Elixir already does that:
```elixir
iex(1)> defmodule JCM do defstruct(a: true) end
{:module, JCM, <<...>>, %JCM{a: true}}
iex(2)> a = %JCM{}
%JCM{a: true}
iex(3)> inspect(a)
"%JCM{a: true}"
```

This was probably something added on newer Elixir versions.
