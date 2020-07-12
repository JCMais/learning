defmodule Issues.CLI do
  import Issues.TableFormatter, only: [format: 2]

  @default_count 4

  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up generating a
  table of the last _n_ issues in a github project

  To run this directly, use:
  mix run -e 'Issues.CLI.process({"elixir-lang", "elixir", 6})'
  """

  def main(argv) do
    run(argv)
  end

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or --help, which returns :help.

  Otherwise it is a github user name, project name, and (optionally)
  the number of entries to format

  Return the tuple of `{ user, project, count }`, or `:help` if help was given.
  """
  def parse_args(argv) do
    OptionParser.parse(argv,
      switches: [help: :boolean],
      aliases: [h: :help]
    )
    |> elem(1)
    |> args_to_internal_represenation
  end

  defp args_to_internal_represenation([user, project, count]),
    do: {user, project, String.to_integer(count)}

  defp args_to_internal_represenation([user, project]), do: {user, project, @default_count}
  defp args_to_internal_represenation(_), do: :help

  def process(:help) do
    IO.puts("""
    usage: issues <user> <project> [ count | #{@default_count} ]
    """)

    System.halt(0)
  end

  @doc """
  We want to output something like this
    # | created_at           | title
  ----+----------------------+-----------------------------------------
  889 | 2013-03-16T22:03:13Z | MIX_PATH environment variable (of sorts)
  892 | 2013-03-20T19:22:07Z | Enhanced mix test --cover
  893 | 2013-03-21T06:23:00Z | mix test time reports
  898 | 2013-03-23T19:19:08Z | Add mix compile --warnings-as-errors
  """

  def process({user, project, count}) do
    Issues.GithubIssues.fetch(user, project)
    |> decode_response
    |> sort_into_descending_order
    |> last_issues(count)
    |> format(
      id: [label: "#", padding: :left],
      created_at: [label: true, padding: :right],
      title: [label: true, padding: :right]
    )
    |> IO.puts()
  end

  def decode_response({:ok, body}), do: body

  def decode_response({:error, error}) do
    IO.puts(:stderr, "Error fetching from Github: #{error["message"]}")
    System.halt(2)
  end

  def sort_into_descending_order(issues) do
    issues
    |> Enum.sort(fn i1, i2 ->
      i1["created_at"] >= i2["created_at"]
    end)
  end

  # Book asks: How would you write such a function?
  # def last_issues(list, count) do
  #   list
  #   |> Enum.take(count)
  #   |> Enum.reverse
  # end

  # This way:
  def last_issues(list, count), do: _last_issues(list, count)
  defp _last_issues(list, count, acc \\ [])
  defp _last_issues([], _, acc), do: acc
  defp _last_issues(_list, 0, acc), do: acc

  defp _last_issues([head | tail], count, acc) when is_integer(count) and count > 0 do
    _last_issues(tail, count - 1, [head] ++ acc)
  end
end
