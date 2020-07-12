defmodule WeatherHistory do
  def test_data do
    [
      [1_366_225_622, 26, 15, 0.125],
      [1_366_225_622, 27, 15, 0.45],
      [1_366_225_622, 28, 21, 0.25],
      [1_366_229_222, 26, 19, 0.081],
      [1_366_229_222, 27, 17, 0.468],
      [1_366_229_222, 28, 15, 0.60],
      [1_366_232_822, 26, 22, 0.095],
      [1_366_232_822, 27, 21, 0.05],
      [1_366_232_822, 28, 24, 0.03],
      [1_366_236_422, 26, 17, 0.025]
    ]
  end

  def for_location_27([]), do: []

  def for_location_27([[time, 27, temp, rain] | tail]) do
    [[time, 27, temp, rain] | for_location_27(tail)]
  end

  # we need to have fn that matches when the location does not match
  def for_location_27([_ | tail]), do: for_location_27(tail)
  # iex(41)> WeatherHistory.for_location_27(WeatherHistory.test_data)
  # [
  #   [1366225622, 27, 15, 0.45],
  #   [1366229222, 27, 17, 0.468],
  #   [1366232822, 27, 21, 0.05]
  # ]

  # But what if we want to filter for any location
  #  and what if we stop repeating ourselves on the matching for_location above? Then:
  def for_location([], _location), do: []

  def for_location([head = [_, location, _, _] | tail], location) do
    [head | for_location(tail, location)]
  end

  def for_location([_ | tail], location), do: for_location(tail, location)
  # iex(43)> WeatherHistory.for_location(WeatherHistory.test_data, 27)
  # [
  #   [1366225622, 27, 15, 0.45],
  #   [1366229222, 27, 17, 0.468],
  #   [1366232822, 27, 21, 0.05]
  # ]
end
