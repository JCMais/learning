defmodule Example do
  @author "Dave Thomas"

  def get_author do
    @author
  end
end

# Example was written by Dave Thomas
IO.puts("Example was written by #{Example.get_author()}")
