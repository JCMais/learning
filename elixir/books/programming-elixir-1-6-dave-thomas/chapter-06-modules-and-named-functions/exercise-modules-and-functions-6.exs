defmodule Chop do
  def guess(x, a..b) when a <= x and b >= x and x >= 0 do
    guess = get_guess(a..b)
    print_guess(guess)
    do_guess(x, a..b, guess)
  end

  def print_guess(guess), do: IO.puts("Is it #{guess}?")
  def get_guess(a..b), do: a + div(b - a, 2)

  def do_guess(x, _, x), do: IO.puts(x)

  def do_guess(x, _..b, guess) when x > guess do
    new_min = guess + 1
    new_range = new_min..b
    new_guess = get_guess(new_range)
    print_guess(new_guess)
    do_guess(x, new_range, new_guess)
  end

  def do_guess(x, a.._, guess) when x < guess do
    new_max = guess - 1
    new_range = a..new_max
    new_guess = get_guess(new_range)
    print_guess(new_guess)
    do_guess(x, new_range, new_guess)
  end
end
