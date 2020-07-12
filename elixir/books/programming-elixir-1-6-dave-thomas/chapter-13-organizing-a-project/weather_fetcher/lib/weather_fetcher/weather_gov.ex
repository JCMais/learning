defmodule WeatherFetcher.WeatherGov do
  require Logger
  require WeatherFetcher.XML

  @user_agent [{"User-agent", "learning-elixir/1.0"}]

  def fetch(url) do
    Logger.info("Fetching #{url}")

    url
    |> HTTPoison.get(@user_agent)
    |> handle_raw_response
    |> handle_xml_response
  end

  def handle_raw_response({_, %{status_code: status_code, body: body}}) do
    {
      status_code |> check_status_code,
      body |> parse_xml
    }
  end

  defp check_status_code(200), do: :ok
  defp check_status_code(_), do: :error

  defp parse_xml(data) do
    data |> :binary.bin_to_list() |> :xmerl_scan.string()
  end

  def handle_xml_response({:ok, {doc, []}}) do
    [
      location: "//location/text()",
      weather: "//weather/text()",
      temperature: "//temperature_string/text()"
    ]
    |> Enum.map(fn {name, xpath} ->
      {name,
       WeatherFetcher.XML.xpath(doc, xpath) |> Enum.at(0) |> WeatherFetcher.XML.xmlText(:value)}
    end)
    |> Enum.into(%{})
  end

  def handle_xml_response({:ok, _}), do: {:error, "Could not parse the XML content"}
  def handle_xml_response({:error, data}), do: {:error, data}
end
