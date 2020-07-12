defmodule Stacker.StashTest do
  use ExUnit.Case
  alias Stacker.Stash

  # It would probably be better to use property assertions here
  test "can save and load from the stack" do
    Stash.set("abc")
    assert(Stash.get() == "abc")
  end
end
