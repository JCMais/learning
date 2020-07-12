defmodule Issues.TableFormatter do
  @moduledoc """
  This is my own implementation of the table formatter.
  Also the solution for ExerciseOrganizingAProject4
  """
  def format(issues, fields) do
    fields_infos = get_fields_infos(issues, fields)

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
      for issue <- issues do
        for {field_name, _field_label, pad_fn} <- fields_infos do
          issue
          |> convert_issue_field_to_string(field_name)
          |> pad_fn.()
        end
      end

    rows = Enum.map(list, &(&1 |> Enum.join(" | ")))

    Enum.join(header_rows ++ rows ++ [""], "\n")
  end

  defp convert_issue_field_to_string(issue, field) when is_atom(field) do
    convert_issue_field_to_string(issue, Atom.to_string(field))
  end

  defp convert_issue_field_to_string(issue, field), do: to_string(issue[field])

  defp get_fields_infos(issues, fields_options) do
    for {field, options} <- fields_options do
      label = options[:label] || true
      padding = options[:padding] || :left

      header_text =
        case label do
          true -> Atom.to_string(field)
          label -> label
        end

      field_biggest_length =
        issues
        |> Enum.map(&String.length(convert_issue_field_to_string(&1, field)))
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
