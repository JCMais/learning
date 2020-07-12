# Exercise: MacrosAndCodeEvaluation-3

The Elixir test framework, `ExUnit`, uses some clever code-quoting tricks.
For example, if you assert
```elixir
assert 5 < 4
```

you’ll get the error
```
Assertion with < failed
code: 5 < 4
lhs:
5
rhs:
4
```

The test code parsed the assertion parameter into the left-hand side, the
operator, and the right-hand side.

The Elixir source code is on GitHub (at https://github.com/elixir-lang/elixir). The
implementation of this is in the file `elixir/lib/ex_unit/lib/ex_unit/assertions.ex`. Spend
some time reading this file, and work out how it implements this trick.

(Hard) Once you’ve done that, see if you can use the same technique to
implement a function that takes an arbitrary arithmetic expression and
returns a natural-language version.
```
explain do: 2 + 3 * 4
#=> multiply 3 and 4, then add 2
```

## Answer

Woah, this is awesome.

Answer is available at [`./exercise-macros-and-code-evaluation-3.exs`](./exercise-macros-and-code-evaluation-3.exs).

```
❯ elixir exercise-macros-and-code-evaluation-3.ex
code = {:+, [line: 48], [2, {:*, [line: 48], [3, 4]}]}
code = {:+, [line: 49], [1, 2]}
code = {:+, [line: 50], [{:+, [line: 50], [1, 2]}, 3]}
code = {:+, [line: 51], [1, {:*, [line: 51], [2, 3]}]}
code = {:+, [line: 52], [{:*, [line: 52], [1, 3]}, 2]}
code = {:*, [line: 53], [{:+, [line: 53], [1, {:/, [line: 53], [{:+, [line: 53], [2, 4]}, 2]}]}, 3]}
multiply 3 and 4, then add 2
add 1 and 2
add 1 and 2, then add 3
multiply 2 and 3, then add 1
multiply 1 and 3, then add 2
add 2 and 4, then divide 2, then add 1, then multiply 3
```
