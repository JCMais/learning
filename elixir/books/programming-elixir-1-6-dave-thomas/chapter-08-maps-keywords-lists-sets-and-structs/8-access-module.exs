defmodule Test do
  def run do
    # Let's say I have a list of characters
    cast = [
      %{
        character: "Buttercup",
        actor: %{
          first: "Robin",
          last: "Wright"
        },
        role: "princess"
      },
      %{
        character: "Westley",
        actor: %{
          first: "Cary",
          last: "Elwes"
        },
        role: "farm boy"
      }
    ]

    # and I want to return their names
    IO.inspect(get_in(cast, [Access.all(), :character]))

    # Or just the first one
    IO.inspect(get_in(cast, [Access.at(0), :character]))

    # all and at only works for lists

    # if I have an map / struct
    cast = %{
      buttercup: %{
        character: "Buttercup",
        actor: %{
          first: "Robin",
          last: "Wright"
        },
        likes: {"Mario", "Zelda"},
        role: "princess"
      },
      westley: %{
        character: "Westley",
        actor: %{
          first: "Cary",
          last: "Elwes"
        },
        likes: {"Sonic", "Battletoads"},
        role: "farm boy"
      }
    }

    # I can get the buttercup actor first name
    IO.inspect(get_in(cast, [Access.key!(:buttercup), :actor, :first]))

    # And I can use elem to work with tuples
    IO.inspect(get_in(cast, [Access.key!(:buttercup), :likes, Access.elem(0)]))

    # get_and_update_in also works with Access
    # the fn to return the new value is described as:
    # The fun argument receives the value of key (or nil if key is not present) and
    # must return one of the following values:

    #   • a two-element tuple {get_value, new_value}. In this case, get_value is
    #     the retrieved value which can possibly be operated on before being
    #     returned. new_value is the new value to be stored under key.
    #   • :pop, which implies that the current value under key should be removed
    #     from the structure and returned.
    IO.inspect(
      get_and_update_in(cast, [Access.key(:buttercup), :role], fn val -> {val, "queen"} end)
    )

    # And we have Access.pop, which simply removes the key
    # returns a tuple {key_value, updated_obj}
    IO.inspect(Access.pop(%{name: "Elixir", creator: "Valim"}, :name))

    nil
  end
end
