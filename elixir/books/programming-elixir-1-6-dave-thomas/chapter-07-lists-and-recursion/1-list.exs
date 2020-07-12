IO.puts("[3 | []] === [3]")
IO.inspect([3 | []] === [3])

IO.puts("[3 | [2 | []]] === [3, 2]")
IO.inspect([3 | [2 | []]] === [3, 2])

IO.puts("[3 | [2 | [1 | []]]] === [3, 2, 1]")
IO.inspect([3 | [2 | [1 | []]]] === [3, 2, 1])

IO.puts("[head | tail] = [1, 2, 3]")
[head | tail] = [1, 2, 3]

IO.puts("head === 1")
IO.inspect(head === 1)

IO.puts("tail === [2, 3]")
IO.inspect(tail === [2, 3])

# strings with single quotes are represented as a list of integer codepoints
#  So the string 'cat' is 3 codepoints: 99, 97 and 116
IO.puts("[99, 97, 116] === 'cat'")
IO.inspect([99, 97, 116] === 'cat')
