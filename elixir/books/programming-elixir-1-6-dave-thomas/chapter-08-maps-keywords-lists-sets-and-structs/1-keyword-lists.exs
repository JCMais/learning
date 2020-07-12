defmodule Canvas do
  # Keyword lists are good for options
  #  they are basically a list of tuples, where the first item of the tuple is an atom
  #  and the second is their value
  # https://stackoverflow.com/a/28180801/710693
  @defaults [fg: "black", bg: "white", font: "Merriweather"]

  def draw_text(text, options \\ []) do
    options = Keyword.merge(@defaults, options)

    IO.puts("Drawing text #{inspect(text)}")
    IO.puts("Foreground:  #{options[:fg]}")
    IO.puts("Background:  #{Keyword.get(options, :bg)}")
    IO.puts("Font:        #{Keyword.get(options, :font)}")
    IO.puts("Pattern:     #{Keyword.get(options, :pattern, "Default Value")}")
    IO.puts("Style:       #{inspect(Keyword.get_values(options, :style))}")
  end
end

Canvas.draw_text("hello", fg: "red", style: "italic", style: "bold")
