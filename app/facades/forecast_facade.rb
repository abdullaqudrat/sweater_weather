class ForecastFacade

  def initialize(location)
    @location = location
  end

  def get_forecast
    forecast = Forecast.new(raw_weather_data, geocode_data[:formatted_address])
    ForecastSerializer.new(forecast).serializable_hash
  end

  private
    def raw_weather_data
      WeatherService.new(geocode_data[:coordinates]).get_json
    end

    def geocode_data
      GeocodeService.new(@location).formatted_address_and_coordinates
    end
end
