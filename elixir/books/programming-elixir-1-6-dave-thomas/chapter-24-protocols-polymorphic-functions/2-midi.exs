defmodule Midi do
  @moduledoc """
    A MIDI file consists of a sequence of variable-length frames. Each frame
      contains a four-character type, a 32-bit length, and then length bytes of data.
    https://www.csie.ntu.edu.tw/~r92092/ref/midi/
  """

  defstruct(content: <<>>)

  defmodule Frame do
    defstruct(
      type: "xxxx",
      length: 0,
      data: <<>>
    )

    def to_binary(%Midi.Frame{type: type, length: length, data: data}) do
      <<
        type::binary-4,
        length::integer-32,
        data::binary
      >>
    end
  end

  def from_file(name) do
    %Midi{content: File.read!(name)}
  end

  #####
  # Enumerable Protocol
  #####
  defimpl Enumerable, for: Midi do
    # def member?(collection, value)
    # def ?(collection, value)

    ###
    # reduce
    ###
    def reduce(%Midi{content: content}, state, fun) do
      do_reduce(content, state, fun)
    end

    def do_reduce(_content, {:halt, acc}, _fun), do: {:halted, acc}

    def do_reduce(content, {:suspend, acc}, fun),
      do: {:suspended, acc, &do_reduce(content, &1, fun)}

    def do_reduce(_content = "", {:cont, acc}, _fun), do: {:done, acc}

    # This will basically wrap each midi raw frame into our data structure
    # So clients of this Module will not have to mess with the raw midi file. Neat
    def do_reduce(
          <<type::binary-4, length::integer-32, data::binary-size(length), rest::binary>>,
          {:cont, acc},
          fun
        ) do
      frame = %Midi.Frame{type: type, length: length, data: data}
      do_reduce(rest, fun.(frame, acc), fun)
    end

    def count(midi), do: {:ok, Enum.reduce(midi, 0, fn _, acc -> acc + 1 end)}

    # as we don't have a faster way to test for membership or to slice a Midi file, we
    #  are going to returned {:error, __MODULE__} which indicates to Elixir that it should
    #  fallback to a naive algorithm using reduce
    def member?(%Midi{}, %Midi.Frame{}) do
      {:error, __MODULE__}
    end

    def slice(%Midi{}) do
      {:error, __MODULE__}
    end
  end

  #####
  # Collectable Protocol
  # Create a new Midi from a list of Frames
  #####
  defimpl Collectable, for: Midi do
    use Bitwise

    # Calling list |> Enum.into(%Midi{}), %Midi{} will the the value passed below
    def into(%Midi{content: content}) do
      {
        content,
        fn
          acc, {:cont, frame = %Midi.Frame{}} ->
            acc <> Midi.Frame.to_binary(frame)

          acc, :done ->
            %Midi{content: acc}

          _, :halt ->
            :ok
        end
      }
    end
  end

  #####
  # Inspect Protocol
  #####
  defimpl Inspect, for: Midi do
    import Inspect.Algebra

    # empty Midi
    def inspect(%Midi{content: <<>>}, _opts), do: "#Midi[<<empty>>]"

    # non-empty one
    def inspect(midi = %Midi{}, opts) do
      open = color("#Midi[", :map, opts)
      close = color("]", :map, opts)
      separator = color(",", :map, opts)

      container_doc(
        open,
        Enum.to_list(midi),
        close,
        %Inspect.Opts{limit: 4},
        fn frame, _opts -> Inspect.Midi.Frame.inspect(frame, opts) end,
        separator: separator,
        break: :strict
      )
    end
  end

  defimpl Inspect, for: Midi.Frame do
    import Inspect.Algebra

    def inspect(
          %Midi.Frame{
            type: "MThd",
            length: 6,
            data: <<
              format::integer-16,
              tracks::integer-16,
              division::bits-16
            >>
          },
          opts
        ) do
      concat([
        nest(
          concat([
            color("#Midi.Header{", :map, opts),
            break(""),
            "Midi format: #{format},",
            break(" "),
            "tracks: #{tracks}",
            break(" "),
            "timing: #{decode(division)}"
          ]),
          2
        ),
        break(""),
        color("}", :map, opts)
      ])
    end

    def inspect(%Midi.Frame{type: "MTrk", length: length, data: data}, opts) do
      open = color("#Midi.Track{", :map, opts)
      close = color("}", :map, opts)
      separator = color(",", :map, opts)

      content = [
        length: length,
        data: data
      ]

      container_doc(
        open,
        content,
        close,
        %Inspect.Opts{limit: 15},
        fn {key, value}, opts ->
          key = color("#{key}:", :atom, opts)
          concat(key, concat(" ", to_doc(value, opts)))
        end,
        separator: separator,
        break: :strict
      )
    end

    defp decode(<<0::1, beats::15>>) do
      "♩ = #{beats}"
    end

    defp decode(<<1::1, fps::7, beats::8>>) do
      "#{-fps} fps, #{beats}/frame"
    end

    defp decode(x) do
      raise inspect(x)
    end
  end
end
