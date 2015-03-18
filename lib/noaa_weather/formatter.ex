defmodule NoaaWeather.Formatter do
  def display(hash) do
    width = longest_width(hash)

    for {k, v} <- hash do
      k = to_string(k)
      :io.format("~s: ~s~n", [k, v])
    end
  end

  defp longest_width(hash) do
    10
  end
end
