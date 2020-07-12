defmodule My do
  defmacro dumper(param) do
    IO.inspect(param)
  end
end

defmodule Test do
  require My
  # These values represent themselves
  My.dumper(:atom)
  # => :atom
  My.dumper(1)
  # => 1
  My.dumper(1.0)
  # => 1.0
  My.dumper([1, 2, 3])
  # => [1,2,3]
  My.dumper("binaries")
  # => "binaries"
  My.dumper({1, 2})
  # => {1,2}
  My.dumper(do: 1)
  # => [do: 1]
  # And these are represented by 3-element tuples
  My.dumper({1, 2, 3, 4, 5})
  # =>
  {:{}, [line: 25], [1, 2, 3, 4, 5]}

  My.dumper(
    do:
      (
        a = 1
        a + a
      )
  )

  # =>
  [
    #
    do: {
      :__block__,
      [],
      #
      [
        {:=, [line: 32], [{:a, [line: 33], nil}, 1]},
        #
        {:+, [line: 33], [{:a, [line: 33], nil}, {:a, [line: 33], nil}]}
      ]
    }
  ]

  My.dumper do
    1 + 2
  else
    3 + 4
  end

  # =>
  [do: {:+, [line: 53], [1, 2]}, else: {:+, [line: 55], [3, 4]}]
end
