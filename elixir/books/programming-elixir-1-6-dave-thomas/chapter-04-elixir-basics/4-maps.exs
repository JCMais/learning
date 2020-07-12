ioi = &IO.inspect/1

# Collection of key value pairs, like JS hashes
# Keys can be strings
states = %{"PI" => "Piauí", "PR" => "Paraná"}
# Or tuples
map_tuple = %{{:ok, "data"} => :continue, {:error, :network_error} => :retry}
# or atoms
states_atoms = %{:pi => "Piauí", :pr => "Paraná"}
# if the keys are atoms, we can also use the following syntax, like with lists
map_other_syntax = %{PI: "Piauí", PR: "Paraná"}

# We can mix the key types, they are not required to be of the same type:
mixed = %{"PI" => "Piauí", {:ok, "data"} => :continue, :PI => "Piauí"}

# Even expressions are allowed:
name = "Jonathan"
name_map = %{String.downcase(name) => name}

ioi.(states)
ioi.(states_atoms)
ioi.(map_tuple)
ioi.(map_other_syntax)
ioi.(mixed)
ioi.(name_map)

# Maps allow only one entry per key, whereas keyword lists allow the key to be repeated.

# We can use [ ] to access a map element
ioi.(states["PI"])

# Or if the key is an atom, we can use dot notation
# Note: " " are necessary if the key is capitalized
ioi.(states_atoms."PI")
ioi.(map_other_syntax."PI")

# If the key does not exists using [ ] it will return nil
ioi.(states["DF"])
# With dot notation it will return an error:
# ioi.(states_atoms."DF")
# ** (KeyError) key :DF not found in: %{PI: "Piauí", PR: "Paraná"}

###########
# Binaries
###########
bin = <<1, 2>>

ioi.(bin)

###########
# Dates and Times
###########

d1 = Date.new(2018, 03, 05)
ioi.(d1)
{:ok, d1} = Date.new(2018, 03, 05)
ioi.(d1)
d2 = ~D[2019-03-05]
ioi.(d2)
ioi.(d1 == d2)

# Ranges
date_range = Date.range(d1, d2)
# how many days?
ioi.(Enum.count(date_range))
# is day inside range?
ioi.(~D[2019-01-01] in date_range)
