defmodule Blob do
  defstruct content: nil
end

# iex(1)> c "basic.exs"
# [Blob]
# iex(2)> b = %Blob{content: 123}
# %Blob{content: 123}
# iex(3)> inspect b
# "%Blob{content: 123}"
# iex(4)> inspect b, structs: false
# "%{__struct__: Blob, content: 123}"
