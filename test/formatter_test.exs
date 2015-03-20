defmodule FormatterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import NoaaWeather.Formatter

  def sample_data do
    %{ location: "Here", station_id: "KTNB", temperature_string: "69.0%" }
  end

  test "output is correct" do
    result = capture_io(fn -> display(sample_data) end)
    assert result == """
    ------------------------------
    Location:    Here
    Weather:     
    Temperature: 69.0%
    Windchill:   
    Update Time: 
    Station ID:  KTNB
    """
  end
end
