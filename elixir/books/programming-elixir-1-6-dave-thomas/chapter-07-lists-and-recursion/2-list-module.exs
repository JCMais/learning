#
# Concatenate Lists (Slow)
#
IO.inspect("[1, 2, 3] ++ [4, 5, 6]")
IO.inspect([1, 2, 3] ++ [4, 5, 6])

#
# Flatten
#
IO.inspect("List.flatten([[[1], 2], [[[[3], [[[[4]]]]]]]])")
IO.inspect(List.flatten([[[1], 2], [[[[3], [[[[4]]]]]]]]))

#
# Folding (like reduce, but can choose direction)
#
IO.inspect("List.foldl([1,2,3],...)")
IO.inspect(List.foldl([1, 2, 3], "", &"#{&1}(#{&2})"))
IO.inspect("List.foldr([1,2,3],...)")
IO.inspect(List.foldr([1, 2, 3], "", &"#{&1}(#{&2})"))

#
# Updating in the middle (not a cheap operation)
#
list = [1, 2, 3]
IO.inspect(List.replace_at(list, 2, "buckle my shoe"))

#
# Accessing tuples within lists
#
kw = [{:name, "Dave"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]
IO.inspect(kw)
IO.inspect(List.keyfind(kw, :name, 0))
IO.inspect(List.keyfind(kw, "Dallas", 1))
