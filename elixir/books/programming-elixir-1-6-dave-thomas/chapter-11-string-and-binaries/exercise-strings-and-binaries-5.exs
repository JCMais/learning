defmodule ExerciseStringsAndBinaries5 do
  def center(strings) do
    [biggest_string | remaining_strings] =
      Enum.sort(strings, &(String.length(&1) >= String.length(&2)))

    biggest_string_length = String.length(biggest_string)

    remaining_strings_sorted =
      Enum.sort(remaining_strings, &(String.length(&1) <= String.length(&2)))

    (get_centered_strings(remaining_strings_sorted, biggest_string_length) ++ [biggest_string])
    |> Enum.join("\n")
  end

  defp get_centered_strings(strings, comparison_length, acc \\ [])
  defp get_centered_strings([], _, acc), do: acc

  defp get_centered_strings([head | tail], comparison_length, acc) do
    length = String.length(head)
    diff = comparison_length - length
    half = diff / 2
    columns_l = floor(half)
    columns_r = ceil(half)

    centered_string =
      head
      |> String.pad_leading(length + columns_l)
      |> String.pad_trailing(length + columns_l + columns_r)

    get_centered_strings(
      tail,
      comparison_length,
      acc ++ [centered_string]
    )
  end
end

IO.puts(ExerciseStringsAndBinaries5.center(["cat", "elephant", "zebra"]))
