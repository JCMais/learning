# Erlang has a format function
#  http://erlang.org/doc/man/io.html#format-2
# We can call them by using an atom with the same name than the erlang module:
IO.puts(:io.format("The number is ~3.1f~n", [5.6786658]))
