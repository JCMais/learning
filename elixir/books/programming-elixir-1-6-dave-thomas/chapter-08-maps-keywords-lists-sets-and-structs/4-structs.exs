defmodule Subscriber do
  defstruct name: "", has_paid: false, is_over_18: true
end

# Let's play with it
# iex(1)> s1 = %Subscriber{}
# %Subscriber{has_paid: false, is_over_18: true, name: ""}

# Set values:
# iex(2)> s2 = %Subscriber{ name: "Jonathan" }
# %Subscriber{has_paid: false, is_over_18: true, name: "Jonathan"}

# Access values:
# Using dot notation
# iex(3)> s2.name
# "Jonathan"

# # Using pattern matching
# iex(4)> %Subscriber{name: a_name} = s2
# %Subscriber{has_paid: false, is_over_18: true, name: "Jonathan"}
# iex(5)> a_name
# "Jonathan"

# # Update it like a normal map:
# iex(6)> s3 = %Subscriber{s3 | name: "João"}
# %Subscriber{name: "João", over_18: true, paid: true}
