defmodule WeatherFetcherTest do
  use ExUnit.Case
  doctest WeatherFetcher

  test "greets the world" do
    assert WeatherFetcher.hello() == :world
  end
end
