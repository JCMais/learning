defmodule Times do
  defmacro times_n(amount) when is_integer(amount) do
    function_name = String.to_atom("times_#{amount}")

    quote do
      def unquote(function_name)(amount) do
        amount * unquote(amount)
      end
    end
  end
end

defmodule Test do
  require Times

  Times.times_n(3)
  Times.times_n(4)
end

# => 12
IO.inspect(Test.times_3(4))
# => 20
IO.inspect(Test.times_4(5))
