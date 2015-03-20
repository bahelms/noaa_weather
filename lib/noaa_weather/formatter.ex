defmodule NoaaWeather.Formatter do
  def display(hash) do
    IO.puts "------------------------------"
    IO.puts "Location:    #{hash[:location]}"
    IO.puts "Weather:     #{hash[:weather]}"
    IO.puts "Temperature: #{hash[:temperature_string]}"
    IO.puts "Windchill:   #{hash[:windchill_string]}"
    IO.puts "Update Time: #{hash[:observation_time]}"
    IO.puts "Station ID:  #{hash[:station_id]}"
  end
end
