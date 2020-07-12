# Exercise: Functions-1

Go into IEx. Create and run the functions that do the following:
- `list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]`
- `sum.(1, 2, 3) #=> 6`
- `pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]`

## Answer

- `list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]`
  ```elixir
  iex(1)> list_concat = fn (list_a, list_b) -> list_a ++ list_b end
  #Function<43.97283095/2 in :erl_eval.expr/5>
  iex(2)> list_concat.([:a, :b], [:c, :d])
  [:a, :b, :c, :d]
  ```
- `sum.(1, 2, 3) #=> 6`
  ```elixir
  iex(3)> sum = fn (a, b, c) -> a + b + c end
  #Function<42.97283095/3 in :erl_eval.expr/5>
  iex(4)> sum.(1, 2, 3)
  6
  ```
- `pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]`
  ```elixir
  iex(5)> pair_tuple_to_list = fn { a, b } -> [a, b] end
  #Function<44.97283095/1 in :erl_eval.expr/5>
  iex(6)> pair_tuple_to_list.( { 1234, 5678 } )
  [1234, 5678]
  ```
