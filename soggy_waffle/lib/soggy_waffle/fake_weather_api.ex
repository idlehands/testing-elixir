defmodule SoggyWaffle.FakeWeatherAPI do
  require Logger

  @behaviour SoggyWaffle.WeatherAPI.Behaviour

  @spec get_forecast(String.t()) :: {:ok, map()}
  def get_forecast(city) do
    _ = Logger.info("Getting forecast for city: #{city}")

    IO.puts(__MODULE__)

    now = DateTime.utc_now()
    future_unix = DateTime.to_unix(now) + 1

    response = %{
      "list" => [
        %{
          "dt" => future_unix,
          "weather" => [%{"id" => _thunderstorm = 231}]
        }
      ]
    }

    {:ok, response}
  end
end
