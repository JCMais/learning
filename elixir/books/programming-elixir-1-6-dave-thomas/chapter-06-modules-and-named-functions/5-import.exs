defmodule Example do
  def func1 do
    List.flatten([1, [2, 3], 4])
  end

  def func2 do
    # make flatten/1 available on this scope, without having to use List. before the function
    import List, only: [flatten: 1]
    flatten([5, [6, 7], 8])
  end
end
