i = &IO.inspect/1

#
# Convert collection to list
#
list = Enum.to_list(1..5)
i.(list)

#
# Map
#
i.(Enum.map(list, &(&1 * 10)))

#
# Get element at position
#
i.(Enum.at(list, 2))
i.(Enum.at(list, 10, :none))

#
# Filter
#
i.(Enum.filter(list, &(&1 > 2)))

require Integer
i.(Enum.filter(list, &Integer.is_even/1))
i.(Enum.reject(list, &Integer.is_even/1))

#
# Sort and compare
#
i.(Enum.sort(["there", "was", "a", "crooked", "man"]))

i.(
  Enum.sort(
    ["there", "was", "a", "crooked", "man"],
    # important to use <= instead of only < so it's a stable sort
    &(String.length(&1) <= String.length(&2))
  )
)

#
# Split Collection
#
i.(Enum.split(list, 3))
i.(Enum.take(list, 3))
i.(Enum.take_every(list, 2))
i.(Enum.take_while(list, &(&1 < 4)))

#
# Join to form a string
#
i.(Enum.join(list, ", "))

#
# Predicate operations
#
i.(Enum.all?(list, &(&1 < 4)))
i.(Enum.any?(list, &(&1 < 4)))
i.(Enum.member?(list, 4))
i.(Enum.empty?(list))

#
# Reduce
#
i.(
  Enum.reduce(["now", "is", "the", "time"], fn current_word, acc ->
    if String.length(current_word) > String.length(acc) do
      current_word
    else
      acc
    end
  end)
)

i.(
  Enum.reduce(["now", "is", "the", "time"], 0, fn word, longest ->
    if String.length(word) > longest,
      do: String.length(word),
      else: longest
  end)
)

#
# Deal a hand of cards (really cool)
#

deck =
  for rank <- '23456789TJQKA',
      suit <- 'CDHS',
      do: [suit, rank]

hand = deck |> Enum.shuffle() |> Enum.take(13)

hands = deck |> Enum.shuffle() |> Enum.chunk(13)

i.(deck)
i.(hand)
i.(hands)
