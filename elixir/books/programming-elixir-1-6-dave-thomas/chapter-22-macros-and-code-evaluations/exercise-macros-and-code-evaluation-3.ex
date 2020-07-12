defmodule My do
  @operators [:+, :/, :*, :-]
  # defmacro explain({op, _meta, [{left_op, _, _}]})

  defp op_to_text(op) when op in @operators do
    case op do
      :+ ->
        "add"

      :- ->
        "subtract"

      :* ->
        "multiply"

      :/ ->
        "divide"
    end
  end

  defp explainp(
         {op, _meta, [{op_l, meta_l, [left_l, right_l]}, {op_r, meta_r, [left_r, right_r]}]}
       )
       when op in @operators and op_r in @operators and op_l in @operators do
    explainp({op_l, meta_l, [left_l, right_l]}) <>
      ", then " <>
      explainp({op_r, meta_r, [left_r, right_r]}) <> ", then #{op_to_text(op)} them"
  end

  # case when left is a expr and right is not
  defp explainp({op, _meta, [{op_l, meta_l, [left_l, right_l]}, right]})
       when is_number(right) and op in @operators and op_l in @operators do
    explainp({op_l, meta_l, [left_l, right_l]}) <> ", then #{op_to_text(op)} #{right}"
  end

  # inverse of above, right is a expr, left is not
  defp explainp({op, _meta, [left, {op_r, meta_r, [left_r, right_r]}]})
       when is_number(left) and op in @operators and op_r in @operators do
    explainp({op_r, meta_r, [left_r, right_r]}) <> ", then #{op_to_text(op)} #{left}"
  end

  # case n op n
  defp explainp({op, _meta, [left, right]})
       when op in @operators and is_number(left) and is_number(right) do
    "#{op_to_text(op)} #{left} and #{right}"
  end

  defmacro explain(code) do
    IO.puts("code = #{inspect(code)}")
    explainp(code)
  end
end

defmodule Test do
  require My

  IO.puts(My.explain(2 + 3 * 4))
  IO.puts(My.explain(1 + 2))
  IO.puts(My.explain(1 + 2 + 3))
  IO.puts(My.explain(1 + 2 * 3))
  IO.puts(My.explain(1 * 3 + 2))
  IO.puts(My.explain((1 + 4) * (3 + 4) + 1 * (3 - 1) * (5 - 9) + 2))
  IO.puts(My.explain((1 + (2 + 4) / 2) * 3))
end
