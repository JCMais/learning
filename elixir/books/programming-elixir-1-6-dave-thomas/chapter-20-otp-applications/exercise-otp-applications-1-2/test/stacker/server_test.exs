defmodule Stacker.ServerTest do
  use ExUnit.Case
  alias Stacker.Server

  test "can push and pop from the stack" do
    Server.push("abc")
    Server.push(1)
    Server.push("def")

    values = [Server.pop(), Server.pop(), Server.pop()]

    assert values == ["def", 1, "abc"]
  end
end
