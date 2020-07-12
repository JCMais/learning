defprotocol Caesar do
  @fallback_to_any false

  def encrypt(string, shift)
  def rot13(string)
end

defimpl Caesar, for: [List, BitString] do
  def encrypt(charlist, shift) when is_list(charlist) do
    do_encrypt(charlist, shift, '')
  end

  def encrypt(bin, shift) when is_bitstring(bin) do
    do_encrypt(bin, shift, "")
  end

  def rot13(string) do
    encrypt(string, 13)
  end

  defp do_encrypt([head | rest], shift, acc) do
    # IO.puts("------------------------------------")
    # IO.puts("------------- CHARLIST -------------")
    # IO.puts("head       = #{inspect(head)}")
    # IO.puts("'head'     = #{inspect([head | ''])}")
    # IO.puts("rest       = #{inspect(rest)}")
    # IO.puts("acc        = #{inspect(acc)}")
    # IO.puts("------------------------------------")

    crypted_char = get_crypted_char(head, shift)

    do_encrypt(rest, shift, acc ++ [crypted_char])
  end

  defp do_encrypt(<<head::utf8, rest::binary>>, shift, acc) do
    # IO.puts("------------------------------------")
    # IO.puts("------------ BITSTRING -------------")
    # IO.puts("head       = #{inspect(head)}")
    # IO.puts("\"head\"     = #{inspect(<<head::utf8>>)}")
    # IO.puts("rest       = #{inspect(rest)}")
    # IO.puts("acc        = #{inspect(acc)}")
    # IO.puts("------------------------------------")

    crypted_char = get_crypted_char(head, shift)

    do_encrypt(rest, shift, acc <> <<crypted_char::utf8>>)
  end

  defp do_encrypt(s, _shift, acc) when s == '' or s == <<>> do
    acc
  end

  defp get_crypted_char(char, shift) do
    case char do
      c when c >= ?a and c <= ?z -> get_char_in_range(c + shift, ?a, ?z)
      c when c >= ?A and c <= ?Z -> get_char_in_range(c + shift, ?A, ?Z)
      c -> c
    end
  end

  defp get_char_in_range(char, a, b) do
    case char do
      c when c > b -> min(a - 1 + c - b, b)
      c when c < a -> max(b + 1 - a - c, a)
      c -> c
    end
  end
end

defmodule Test do
  def get_existing_rot13_words(file) do
    words_list =
      file
      |> File.read!()
      |> String.split("\n", trim: true)

    words_map =
      words_list
      |> Enum.into(%{}, &{&1, :none})

    # |> Map.new(fn val -> {val, :none} end)

    process_words_list(words_list, words_map)
  end

  defp process_words_list([], map) do
    map
    |> Enum.filter(fn
      {_, v} when v != :none -> true
      _ -> false
    end)
  end

  defp process_words_list([head | tail], map) do
    rot13 = Caesar.rot13(head)

    {_, new_map} =
      Map.get_and_update(map, rot13, fn
        # this will simply ignore adding this value to the map
        nil -> :pop
        val = :none -> {val, head}
      end)

    process_words_list(tail, new_map)
  end
end

file = "./all copy.csv"
IO.inspect(Test.get_existing_rot13_words(file))
