# Exercise: ListsAndRecursion-5

Implement the following `Enum` functions using no library functions or list comprehensions:
 - `all?`
 - `each`
 - `filter`
 - `split`
 - `take`
 
You may need to use an if statement to implement `filter`. The syntax for this is
```elixir
if condition do
  expression(s)
else
  expression(s)
end
```

## Answer

See source code at [`./exercise-lists-and-recursion-5.exs`](./exercise-lists-and-recursion-5.exs)
```
❯ iex ./exercise-lists-and-recursion-5.exs
Erlang/OTP 23 [erts-11.0.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Test.run     
List: [1, 2, 3, 4, 5]
MyEnum.all?(list, &is_atom/1)
true
MyEnum.all?(list, &is_atom/1)
false
MyEnum.each(list, fn x -> IO.puts(x) end)
1
2
3
4
5
:ok
MyEnum.filter([1, 2, 3], fn x -> x >= 2 end)
[2, 3]
MyEnum.split(list, 0) = {[], [1, 2, 3, 4, 5]}
Enum.split(list, 0) == MyEnum.split(list, 0)
true

MyEnum.split(list, 3) = {[1, 2, 3], [4, 5]}
Enum.split(list, 3) == MyEnum.split(list, 3)
true

MyEnum.split(list, 10) = {[1, 2, 3, 4, 5], []}
Enum.split(list, 10) == MyEnum.split(list, 10)
true

MyEnum.split(list, -3) = {[1, 2], [3, 4, 5]}
Enum.split(list, -3) == MyEnum.split(list, -3)
true

MyEnum.split(list, -10) = {[], [1, 2, 3, 4, 5]}
Enum.split(list, -10) == MyEnum.split(list, -10)
true

MyEnum.take([1,2,3,4], 0) == []
MyEnum.take([1,2,3,4], 0) == Enum.take([1,2,3,4], 0)
true

MyEnum.take([1,2,3,4], 1) == [1]
MyEnum.take([1,2,3,4], 1) == Enum.take([1,2,3,4], 1)
true

MyEnum.take([1,2,3,4], 3) == [1, 2, 3]
MyEnum.take([1,2,3,4], 3) == Enum.take([1,2,3,4], 3)
true

MyEnum.take([1,2,3,4], 4) == [1, 2, 3, 4]
MyEnum.take([1,2,3,4], 4) == Enum.take([1,2,3,4], 4)
true

MyEnum.take([1,2,3,4], 5) == [1, 2, 3, 4]
MyEnum.take([1,2,3,4], 5) == Enum.take([1,2,3,4], 5)
true

MyEnum.take([1,2,3,4], -1) == [4]
MyEnum.take([1,2,3,4], -1) == Enum.take([1,2,3,4], -1)
true

MyEnum.take([1,2,3,4], -5) == [1, 2, 3, 4]
MyEnum.take([1,2,3,4], -5) == Enum.take([1,2,3,4], -5)
true

nil
```
