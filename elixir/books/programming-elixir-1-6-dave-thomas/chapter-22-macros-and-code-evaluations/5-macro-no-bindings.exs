defmodule My do
  defmacro mydef(name) do
    quote do
      def unquote(name)(), do: unquote(name)
    end
  end
end

defmodule Test do
  require My
  [:fred, :bert] |> Enum.each(&My.mydef(&1))
end

IO.puts(Test.fred())
# Above will fail:
# ❯ elixir 5-macro-no-bindings.exs 
# ** (CompileError) 5-macro-no-bindings.exs:11: invalid syntax in def x1()
#     (elixir 1.10.3) lib/enum.ex:783: Enum."-each/2-lists^foreach/1-0-"/2
#     (elixir 1.10.3) lib/enum.ex:783: Enum.each/2
#     5-macro-no-bindings.exs:11: (module)
# This happens because the each loop has not yet executed when our macro is called. We must use bindings
