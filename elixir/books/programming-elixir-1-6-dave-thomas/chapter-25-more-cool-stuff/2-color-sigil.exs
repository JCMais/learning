defmodule ColorSigil do
  import Bitwise
  # The book's version of this sigil used a keyword list with two nested keyword lists
  #  for the named colors, one for RGB and another one HSB
  # Here I'm using a single map and a function to convert from RGB to HSB/HSV
  # The return of the sigil is also different, the book version returned the hex number for rgb
  #  and a 3-elem tuple for HSB, here I am returning a 3-elem tuple for both.
  @colors %{
    red: 0xFF0000,
    green: 0x00FF00,
    blue: 0x0000FF
  }

  def sigil_c(color_name, []), do: get_color(color_name, :rgb)
  def sigil_c(color_name, 'r'), do: get_color(color_name, :rgb)
  def sigil_c(color_name, 'h'), do: get_color(color_name, :hsb)

  defp get_color(color_name, :rgb) do
    get_rgb_tuple_from_hex(@colors[String.to_atom(color_name)])
  end

  defp get_color(color_name, :hsb) do
    convert_rgb_to_hsb(get_color(color_name, :rgb))
  end

  defp get_rgb_tuple_from_hex(rgb_hex) do
    r = rgb_hex >>> 16 &&& 255
    g = rgb_hex >>> 8 &&& 255
    b = rgb_hex &&& 255

    {r, g, b}
  end

  defp convert_rgb_to_hsb({red, green, blue}) do
    min = min(red, min(green, blue))
    max = max(red, max(green, blue))
    delta = max - min

    b = max / 255

    s =
      case max do
        0 ->
          0

        _ ->
          delta / max
      end

    h =
      60 *
        case max do
          0 -> 0
          # between yellow & magenta
          val when val == red -> (green - blue) / delta
          # between cyan & yellow
          val when val == green -> 2 + (blue - red) / delta
          # between magenta & cyan
          _ -> 4 + (red - green) / delta
        end

    {
      cond do
        h < 0 -> h + 360
        true -> h
      end,
      s,
      b
    }
  end

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [sigil_c: 2]
      import unquote(__MODULE__), only: [sigil_c: 2]
    end
  end
end

defmodule Test do
  use ColorSigil
  def rgb, do: IO.inspect(~c{red})
  def hsb, do: IO.inspect(~c{red}h)
end

# {255, 0, 0}
Test.rgb()
# {0.0, 1.0, 1.0}
Test.hsb()
