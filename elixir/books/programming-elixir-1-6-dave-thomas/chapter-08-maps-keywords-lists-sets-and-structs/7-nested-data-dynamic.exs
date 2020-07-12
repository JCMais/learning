defmodule Test do
  def run do
    # report = %BugReport{
    #   owner: %Customer{name: "Jonathan", company: "JCM"},
    #   details: "It's broken"
    # }

    # this will not work for dynamic access:
    # report = put_in(report, [:owner, :name], "Mr. Jonathan")
    # See https://github.com/elixir-lang/elixir/issues/4126#issuecomment-167902846

    report = %{
      owner: %{name: "Jonathan", company: "JCM"},
      details: "It's broken"
    }

    IO.inspect(report)

    report = put_in(report, [:owner, :name], "Mr. Jonathan")

    IO.inspect(report)

    # get_in is interesting, because it allows to pass a fn
    authors = [
      %{name: "José", language: "Elixir"},
      %{name: "Matz", language: "Ruby"},
      %{name: "Larry", language: "Perl"}
    ]

    # Per h get_in
    # If a key is a function, the function will be invoked passing three arguments:
    # • the operation (:get)
    # • the data to be accessed
    # • a function to be invoked next
    languages_with_an_r = fn :get, collection, next_fn ->
      for row <- collection do
        if String.contains?(row.language, "r") do
          next_fn.(row)
        end
      end
    end

    IO.inspect(get_in(authors, [languages_with_an_r, :name]))

    nil
  end
end
