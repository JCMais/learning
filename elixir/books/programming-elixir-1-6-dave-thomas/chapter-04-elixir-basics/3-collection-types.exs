ioi = &IO.inspect/1

# Elixir collections can hold values of any type (including other collections).

###########
# Tuple
###########
# Tuples should have no more than 4 elements, more than that 
#  and we probably should use another data structure, like maps or structs
# The tuple {:ok, something} is a common return value for functions
ioi.({1, 2})
ioi.({:ok, "some data"})
ioi.({:error, "some data"})

###########
# Lists
###########
# A list may either be empty or consist of a head and a tail
# The head contains a value, and the tail is itself another list, which can be empty
# They are not the conventional array in other programming languages, but instead they are
#  a linked data structure.
[1 | [2 | [3 | []]]]

## concat
ioi.([1, 2, 3] ++ [4, 5])
## diff
ioi.([1, 2, 3, 4, 5] -- [4, 5])
## is member
ioi.(1 in [1, 2])
ioi.("nah" in [1, 2])

## There are also improper lists - The book does not mention them 
[1 | [2 | [3 | 4]]]
# which can also be written as
[1, 2, 3 | 4]

###########
# Keyword Lists
###########
ioi.(name: "Dave", city: "Dallas", likes: "Programming")
# is the same than:
ioi.([{:name, "Dave"}, {:city, "Dallas"}, {:likes, "Programming"}])
# which can be written like this, if it's the last argument in a function call:
ioi.(name: "Dave", city: "Dallas", likes: "Programming")

# Keyword Lists are often used to pass options to functions
