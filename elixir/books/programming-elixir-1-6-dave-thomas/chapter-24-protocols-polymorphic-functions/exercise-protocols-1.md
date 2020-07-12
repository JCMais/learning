# Exercise: Protocols-1

A basic Caesar cypher consists of shifting the letters in a message by a fixed offset. For an offset of 1, for example, `a` will become `b`, `b` will become `c` and `z` will become `a`. If the offset is 13, we have the ROT13 algorithm.

Lists and binaries can be _stringlike_. Write a `Caesar` protocol that applies to both. It would include two functions: `encrypt(string, shift)` and `rot13(string)`.

## Answer

See source code at [`./exercise-protocols-1.exs`](./exercise-protocols-1.exs)

```
❯ elixir exercise-protocols-1.exs
[
  '123nopqrstuvwxyzabcdefghijklm456',
  "123nopqrstuvwxyzabcdefghijklm456",
  "GUR DHVPX OEBJA SBK WHZCF BIRE GUR YNML QBT",
  ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
   "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"],
  [1, 2, 3, "abc", 'abc', " ", %{}]
]
```
