defmodule NoaaWeather.Conditions do
  require Logger
  import XMLParser
  @url Application.get_env(:noaa_weather, :conditions_url)

  def fetch(location_code) do
    Logger.info "Fetching conditions for #{location_code}..."
    HTTPoison.get("#{@url}/#{location_code}.xml") 
      |> handle_response
  end

  def handle_response({:ok, %{body: body}}) do
    Logger.info "Successful response"
    # Logger.info fn -> inspect(body) end
    {xml, _} = :xmerl_scan.string(to_char_list(body))
    Logger.info inspect xml
  end

  def handle_response({:error, %{status: status, body: body}}) do
    Logger.error "Error: #{status} returned"
  end
end
