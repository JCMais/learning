defmodule WeatherFetcher.XML do
  @moduledoc """
  This is a helper module that we are going to use to parse the XML
  It's based on this post: https://pspdfkit.com/blog/2018/how-to-parse-xml-documents-in-elixir/
  And by based, read "mostly copied fully from"
  """
  # The reason we need these is because the data returned from xmerl_scan are Erlang
  #  records http://erlang.org/doc/reference_manual/records.html
  #  and we need to convert them to Elixir records: https://hexdocs.pm/elixir/Record.html
  import Record
  defrecord(:xmlElement, extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl"))
  defrecord(:xmlAttribute, extract(:xmlAttribute, from_lib: "xmerl/include/xmerl.hrl"))
  defrecord(:xmlText, extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl"))

  def get_child_elements(element) do
    Enum.filter(xmlElement(element, :content), fn child ->
      Record.is_record(child, :xmlElement)
    end)
  end

  def find_child(children, name) do
    Enum.find(children, fn child -> xmlElement(child, :name) == name end)
  end

  def get_text(element) do
    Enum.find(xmlElement(element, :content), fn child ->
      Record.is_record(child, :xmlText)
    end)
    |> xmlText(:value)
  end

  # This one was copied from https://gist.github.com/sasa1977/5967224
  def xpath(nil, _), do: []

  def xpath(node, path) do
    :xmerl_xpath.string(to_char_list(path), node)
  end
end
