defmodule NoaaWeather.Mixfile do
  use Mix.Project

  def project do
    [app: :noaa_weather,
     version: "0.0.1",
     elixir: "~> 1.0",
     escript: escript_config,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:httpoison, "~> 0.6"}]
  end

  defp escript_config do
    # Package the program with mix: mix escript.build
    [main_module: NoaaWeather.CLI]
  end
end
