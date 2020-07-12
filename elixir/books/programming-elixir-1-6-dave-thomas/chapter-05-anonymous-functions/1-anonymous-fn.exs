sum = fn a, b -> a + b end

IO.inspect(sum)
# we don’t use a dot for named function calls. We just do fn_name arg1, arg2
#  this is a difference between named and anonymous functions
IO.inspect(sum.(1, 2))

# Fn argument is not a simple assignment of the supplied args to each arg
#  instead it's a pattern match
swap = fn {a, b} -> {b, a} end
IO.inspect(swap.({1, 2}))

list_concat = fn list_a, list_b -> list_a ++ list_b end
IO.inspect(list_concat.([:a, :b], [:c, :d]))

# It's not possible to create a recursive anonymous fn without using a y combinator
sum_all = fn
  a, b, c -> a + b + c
end

IO.inspect(sum_all.(1, 2, 3))

pair_tuple_to_list = fn {a, b} -> [a, b] end
IO.inspect(pair_tuple_to_list.({1, 2}))

# Multiple body function pattern matching
handle_file = fn
  {:ok, file} -> "Read data: #{IO.read(file, :line)}"
  # could be :error too
  {_, error} -> "Error: #{:file.format_error(error)}"
end

IO.inspect(handle_file.(File.open("./1-anonymous-fn.exs")))
IO.inspect(handle_file.(File.open("./1-anonymous-fn-non-existing.exs")))
