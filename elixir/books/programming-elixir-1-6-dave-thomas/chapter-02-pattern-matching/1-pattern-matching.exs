# Pin operator makes matching
#  use the variable value, instead of
#  bounding it to the new value
a = 1
a = 2
# ^a = 1 # will fail

# lists
list = [1, 2, 3]
[head | tail] = list
[a, b, c] = list

# ignoring values with _
[a, _, _] = list
