defmodule FormatterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import NoaaWeather.Formatter

  def sample_data do
    %{ location: "Here", station_id: "KTNB", temperature: "69.0%" }
  end

  test "output is correct" do
    result = capture_io(fn -> display(sample_data) end)
    assert result == """
    location: Here
    station_id: KTNB
    temperature: 69.0%
    """
  end
end
