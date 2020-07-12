defmodule StatsTest do
  use ExUnit.Case
  use ExUnitProperties

  describe "Stats on lists of ints" do
    # property says this is a property test
    # That is, it's testing intrinsic properties of the function.
    # More details at https://hexdocs.pm/stream_data/ExUnitProperties.html

    property "count not negative" do
      check all(l <- list_of(integer())) do
        assert Stats.count(l) >= 0
      end
    end

    property "single element lists are their own sum" do
      check all(number <- integer()) do
        assert Stats.sum([number]) == number
      end
    end

    # This gave an error
    #  as it tried to pass an empty list to our sum fn
    # We could fix our code, but it's also possible to limit the data from the generator, like below
    @tag :skip
    property "sum equals average times count - wrong" do
      check all(l <- list_of(integer())) do
        assert_in_delta(
          Stats.sum(l),
          Stats.count(l) * Stats.average(l),
          1.0e-6
        )
      end
    end

    property "sum equals average times count - using nonempty filter" do
      check all(l <- list_of(integer()) |> nonempty()) do
        assert_in_delta(
          Stats.sum(l),
          Stats.count(l) * Stats.average(l),
          1.0e-6
        )
      end
    end

    property "sum equals average times count - using min_length option" do
      check all(l <- list_of(integer(), min_length: 1)) do
        assert_in_delta(
          Stats.sum(l),
          Stats.count(l) * Stats.average(l),
          1.0e-6
        )
      end
    end
  end
end
