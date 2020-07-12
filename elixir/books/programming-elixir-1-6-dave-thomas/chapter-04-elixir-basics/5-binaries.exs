ioi = &IO.inspect/1

# Binary literals are enclosed between << and >>

bin = <<1, 2>>

ioi.(bin)
ioi.(byte_size(bin))

# We can pass modifiers to control the type and size of each individual field
bin = <<3::size(2), 5::size(4), 1::size(2)>>
ioi.(bin)
ioi.(:io.format("~-8.2b~n", :binary.bin_to_list(bin)))
ioi.(byte_size(bin))

# Elixir uses them to represent UTF strings, which we are going to see later.
