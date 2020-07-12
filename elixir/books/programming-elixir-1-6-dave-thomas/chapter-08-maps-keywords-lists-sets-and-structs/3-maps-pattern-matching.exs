# Maps are the go to key/value data structure
#  they are like hashes / objects in JS
i = &(IO.inspect(&1) && IO.puts(''))

person = %{name: "Jonathan", height: 1.65}
i.(person)

# We can pattern match if a key exists
# This is basically JS destructuring
%{name: a_name} = person
i.(a_name)

# We can pattern match multiple key exists, ignoring their value
%{name: _, height: _} = person

# We can explicitely pattern match a value
%{name: "Jonathan"} = person

# This destructuring is useful for iterating over a list of maps
people = [
  %{name: "Grumpy", height: 1.24},
  %{name: "Dave", height: 1.88},
  %{name: "Dopey", height: 1.32},
  %{name: "Shaquille", height: 2.16},
  %{name: "Sneezy", height: 1.28}
]

i.(for person = %{height: height} <- people, height > 1.5, do: person)

# We cannot bind keys when pattern matching, only the values, so this is invalid:
# %{item => :ok} = %{1 => :ok, 2 => :error}
# ** (CompileError) 3-maps-pattern-matching.exs:31: cannot use variable item as map key inside a pattern. Map keys in patterns can only be literals (such as atoms, strings, tuples, etc.) or an existing variable matched with the pin operator (such as ^some_var)
#     (stdlib) lists.erl:1263: :lists.foldl/3

# Pattern matching can match variable keys using the pin operator ^key
data = %{name: "Dave", state: "TX", likes: "Elixir"}
i.(data)

values =
  for key <- [:name, :likes] do
    %{^key => value} = data
    value
  end

i.(values)

#
# Updating values in a Map
#
my_map = %{a: 1, b: 2, c: 3}
i.(my_map)

my_map1 = %{my_map | b: "two", c: "three"}
i.(my_map1)

my_map2 = %{my_map1 | a: "one"}
i.(my_map2)

# my_map3 = %{my_map2 | d: "four"}
# Cannot add new keys
# ** (KeyError) key :d not found
#     3-maps-pattern-matching.exs:59: (file)
#     (elixir) lib/code.ex:767: Code.require_file/2
# We must use Map.put_new/3
my_map3 = Map.put_new(my_map2, :d, "four")
i.(my_map3)
