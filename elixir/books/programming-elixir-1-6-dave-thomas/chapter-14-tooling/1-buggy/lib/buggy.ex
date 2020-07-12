defmodule Buggy do
  def parse_header(<<
        format::integer-16,
        tracks::integer-16,
        # bugged
        # division::integer-16
        # correct
        division::bits-16
      >>) do
    # Breakpoint directly into the code
    # require IEx
    # IEx.pry()
    IO.puts("format: #{format}")
    IO.puts("tracks: #{tracks}")
    IO.puts("division: #{decode(division)}")
  end

  # Bugged version had the first bits below swapped

  def decode(<<0::1, beats::15>>) do
    "♩ = #{beats}"
  end

  def decode(<<1::1, fps::7, beats::8>>) do
    "#{-fps} fps, #{beats}/frame"
  end
end
