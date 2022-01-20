defmodule SoggyWaffle.NoOpWeatherAPI do
  @behaviour SoggyWaffle.WeatherAPI.Behaviour

  @spec get_forecast(String.t()) :: {:ok, map()}
  def get_forecast(city) do
    response = %{
      "list" => [
        %{
          "dt" => DateTime.to_unix(DateTime.utc_now()) + (_seconds = 60),
          "weather" => [%{"id" => _thunderstorm = 231}]
        }
      ]
    }

    {:ok, response}
  end
end
