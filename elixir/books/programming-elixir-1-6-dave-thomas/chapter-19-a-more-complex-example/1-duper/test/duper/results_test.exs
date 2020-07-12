defmodule Duper.ResultsTest do
  use ExUnit.Case
  alias Duper.Results

  test "can add entries to the results" do
    Results.add_hash_for_path("file-a", "abc")
    Results.add_hash_for_path("file-b", "def")
    Results.add_hash_for_path("file-c", "abc")
    Results.add_hash_for_path("file-d", "ghi")
    Results.add_hash_for_path("file-e", "def")
    Results.add_hash_for_path("file-f", "jkl")

    duplicates = Results.find_duplicated_files()

    assert(length(duplicates) == 2)

    assert ~w{file-c file-a} in duplicates
    assert ~w{file-e file-b} in duplicates
  end
end
