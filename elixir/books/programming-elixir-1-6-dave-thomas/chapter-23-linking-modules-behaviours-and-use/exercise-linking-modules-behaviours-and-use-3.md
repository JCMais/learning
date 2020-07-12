# Exercise: LinkingModules-BehavioursAndUse-3

(Hard) Try adding a method definition with a guard clause to the `Test` module. You’ll find that the tracing no longer works.
– Find out why.
– See if you can fix it.

## Answer

It does not work because when we add a guard clause to the method definition, like this one:
```elixir
  def add_list(list) when is_list(list),
    do: Enum.reduce(list, 0, &(&1 + &2))
```

the AST becomes:
```elixir
{:when, [line: 62],
 [
   {:add_list, [line: 62], [{:list, [line: 62], nil}]},
   {:is_list, [line: 62], [{:list, [line: 62], nil}]}
 ]}
```

Which our `Tracer` module does not know how to print correctly.

Working code is available at [`./exercise-linking-modules-behaviours-and-use-3.exs`](./exercise-linking-modules-behaviours-and-use-3.exs).
