defmodule My do
  defmacro mydef(name) do
    # bind_quoted defers the execution of unquote calls. So they are defined at runtime.
    quote bind_quoted: [name: name] do
      def unquote(name)(), do: unquote(name)
    end
  end
end

defmodule Test do
  require My
  [:fred, :bert] |> Enum.each(&My.mydef(&1))
end

# => fred
IO.puts(Test.fred())
