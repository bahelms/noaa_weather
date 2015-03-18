defmodule NoaaWeather.Conditions do
  require Logger
  import NoaaWeather.XMLParser
  @url Application.get_env(:noaa_weather, :conditions_url)

  def fetch(location_code) do
    Logger.info "Fetching conditions for #{location_code}..."
    HTTPoison.get("#{@url}/#{location_code}.xml") 
      |> handle_response
  end

  def handle_response({:ok, %{body: body}}) do
    Logger.info "Successful response"
    parse_xml(body)
  end

  def handle_response({:error, %{status: status, body: body}}) do
    Logger.error "Error: #{status} returned"
  end
end

