defmodule NoaaWeather.CLI do
  alias NoaaWeather.Conditions
  alias NoaaWeather.Formatter

  def main(argv) do
    parse_args(argv) |> process
  end

  def parse_args(args) do
    case OptionParser.parse(args) do
      {_, [location_code], _} -> location_code
      _                       -> :no_match
    end
  end

  def process(:no_match) do 
    IO.puts "usage: noaa_weather <location_code>"
    System.halt(0)
  end

  def process(location_code) do
    Conditions.fetch(location_code) |> Formatter.display
  end
end

