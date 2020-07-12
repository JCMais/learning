# Exercise: Protocols-3

Collections that implement the `Enumerable` protocol define `count`, `member?`, `reduce`, and `slice` functions. The `Enum` module uses these to implement methods such as `each`, `filter`, and `map`.  

Implement your own versions of `each`, `filter`, and `map` in terms of `reduce`.

## Answer

See source code at [`./exercise-protocols-3.exs`](./exercise-protocols-3.exs)
```
❯ elixir exercise-protocols-3.exs
- running MyEnum.each for []
- result: :ok
----
- running MyEnum.each for ["a", "b"]
"a"
"b"
- result: :ok

----###-----

- running MyEnum.filter !!el for []
- result: []
----
- running MyEnum.filter rem(el, 2) == 0 for [2, 3, 4, 5]
- result: [2, 4]

----###-----

- running MyEnum.map 1 for []
- result: []
----
- running MyEnum.map el * el for [2, 3, 4, 5]
- result: [4, 9, 16, 25]
```
