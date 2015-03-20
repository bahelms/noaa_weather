defmodule CLITest do
  use ExUnit.Case
  import NoaaWeather.CLI

  test "parse_args returns location code when one given" do
    assert parse_args(["KTNB"]) == "KTNB"
  end

  test "parse_args returns :no_match when nothing matches" do
    assert parse_args([:crap, :hey]) == :no_match
  end
end
