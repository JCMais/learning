defmodule My do
  defmacro unless(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)

    quote do
      case unquote(condition) do
        val when val in [false, nil] ->
          unquote(do_clause)

        _ ->
          nil
      end
    end
  end
end

defmodule Test do
  require My

  a =
    My.unless 1 == 2 do
      IO.puts("1 != 2")
    end

  b =
    My.unless 2 == 2 do
      IO.puts("1 != 2")
    end

  IO.inspect(a)
  IO.inspect(b)
end
