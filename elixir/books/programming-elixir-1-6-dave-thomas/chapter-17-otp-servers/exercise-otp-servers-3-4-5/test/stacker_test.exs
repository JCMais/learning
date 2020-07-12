defmodule StackerTest do
  use ExUnit.Case
  doctest Stacker

  test "greets the world" do
    assert Stacker.hello() == :world
  end
end
