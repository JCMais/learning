defmodule WeatherFetcher.CLI do
  import WeatherFetcher.TableFormatter, only: [format: 2]

  @moduledoc """
  Handles the command line parsing to generate a table with the information
  provided in the passed xml file

  To run this directly, use
  mix run -e 'WeatherFetcher.CLI.process({"https://w1.weather.gov/xml/current_obs/KDTO.xml"})'
  """

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or --help, which returns :help.

  Otherwise it is the URL of the weather.gov XML

  Return the tuple `{ url }`, or `:help` if help was given.
  """
  def parse_args(argv) do
    OptionParser.parse(argv,
      switches: [help: :boolean],
      aliases: [h: :help]
    )
    |> elem(1)
    |> args_to_internal_represenation
  end

  defp args_to_internal_represenation([url]), do: {url}
  defp args_to_internal_represenation(_), do: :help

  def process(:help) do
    IO.puts("""
    usage: weather_fetcher <weather.gov url>
    """)

    System.halt(0)
  end

  def process({url}) do
    url
    |> WeatherFetcher.WeatherGov.fetch()
    |> Map.new(fn {k, v} -> {Atom.to_string(k), v} end)
    |> List.wrap()
    |> format(
      location: [label: true, padding: :left],
      weather: [label: true, padding: :right],
      temperature: [label: true, padding: :right]
    )
    |> IO.puts()
  end
end
