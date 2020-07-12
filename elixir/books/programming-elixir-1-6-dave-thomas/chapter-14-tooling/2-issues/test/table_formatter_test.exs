defmodule TableFormatterTest do
  # bring in the test functionality
  use ExUnit.Case
  alias Issues.TableFormatter, as: TF

  @simple_test_data [
    %{"c1" => "r1 c1", "c2" => "r1 c2", "c3" => "r1 c3", "c4" => "r1+++c4"},
    %{"c1" => "r2 c1", "c2" => "r2 c2", "c3" => "r2 c3", "c4" => "r2 c4"},
    %{"c1" => "r3 c1", "c2" => "r3 c2", "c3" => "r3 c3", "c4" => "r3 c4"},
    %{"c1" => "r4 c1", "c2" => "r4++c2", "c3" => "r4 c3", "c4" => "r4 c4"}
  ]
  @fields [
    c1: [label: "c1a", padding: :left],
    c2: [label: true, padding: :right],
    c4: [label: true, padding: :right]
  ]

  test "Output is correct" do
    result = TF.format(@simple_test_data, @fields)

    assert result == """
             c1a | c2     | c4     
           ------+--------+--------
           r1 c1 | r1 c2  | r1+++c4
           r2 c1 | r2 c2  | r2 c4  
           r3 c1 | r3 c2  | r3 c4  
           r4 c1 | r4++c2 | r4 c4  
           """
  end
end
