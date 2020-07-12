defmodule Issues.TableFormatter do
  @moduledoc """
  This is my own implementation of the table formatter shown in the book. 
  It is also the solution for ExerciseOrganizingAProject4
  """

  @doc """
  Takes a list of row data, where each row is a Map in the same format returned from Poison 
  JSON parse, and returns a string with that data formatted according to the fields specifications.

  ## Example
    iex> rows = [%{"f_a" => "value of field a in row 1", "f_b" => true, "f_c" => 1}, %{"f_a" => "val of field_a row 2", "f_b" => false, "f_c" => 2}]
    iex> fields_defs = [f_a: [label: "a", padding: :left], f_b: [label: true, padding: :right]]
    iex> Issues.TableFormatter.format(rows, fields_defs)
    "                        a | f_b  \\n--------------------------+------\\nvalue of field a in row 1 | true \\n     val of field_a row 2 | false\\n"
  """
  def format(rows, fields) do
    fields_infos = get_fields_infos(rows, fields)

    header_row_labels =
      fields_infos
      |> Enum.map(fn {_, label, _} -> label end)
      |> Enum.join(" | ")

    header_row_underline =
      fields_infos
      |> Enum.map(fn {_, label, _} -> "-" |> String.duplicate(String.length(label)) end)
      |> Enum.join("-+-")

    header_rows = [header_row_labels, header_row_underline]

    list =
      for row <- rows do
        for {field_name, _field_label, pad_fn} <- fields_infos do
          row
          |> convert_row_field_to_string(field_name)
          |> pad_fn.()
        end
      end

    rows = Enum.map(list, &(&1 |> Enum.join(" | ")))

    Enum.join(header_rows ++ rows ++ [""], "\n")
  end

  defp convert_row_field_to_string(row, field) when is_atom(field) do
    convert_row_field_to_string(row, Atom.to_string(field))
  end

  defp convert_row_field_to_string(row, field), do: to_string(row[field])

  defp get_fields_infos(rows, fields_options) do
    for {field, options} <- fields_options do
      label = options[:label] || true
      padding = options[:padding] || :left

      header_text =
        case label do
          true -> Atom.to_string(field)
          label -> label
        end

      field_biggest_length =
        rows
        |> Enum.map(&String.length(convert_row_field_to_string(&1, field)))
        |> Enum.sort(&(&1 >= &2))
        |> Enum.at(0)
        |> max(String.length(header_text))

      pad_fn =
        case padding do
          :right -> &String.pad_trailing(&1, field_biggest_length)
          :left -> &String.pad_leading(&1, field_biggest_length)
        end

      {
        Atom.to_string(field),
        pad_fn.(header_text),
        pad_fn
      }
    end
  end
end
