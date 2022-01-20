# ---
# Excerpted from "Testing Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/lmelixir for more book information.
# ---
defmodule SoggyWaffle do
  @weather_api_module Application.compile_env(
                        :soggy_waffle,
                        :weather_api_module,
                        SoggyWaffle.WeatherAPI
                      )

  def rain?(city, datetime) do
    weather_api_task =
      Task.async(fn ->
        @weather_api_module.get_forecast(city)
      end)

    with {:ok, response} <- Task.await(weather_api_task) do
      {:ok, weather_data} =
        SoggyWaffle.WeatherAPI.ResponseParser.parse_response(response)

      SoggyWaffle.Weather.imminent_rain?(weather_data, datetime)
    end
  end
end
