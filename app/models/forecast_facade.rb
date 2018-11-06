class ForecastFacade


  def initialize(location)
    @location = location
  end

  def get_forecast
    geocode_data = GeocodeService.new(@location).formatted_address_and_coordinates
    raw_weather_data = WeatherService.new(geocode_data[:coordinates]).get_json
    ForecastSerializer.new(Forecast.new(raw_weather_data, geocode_data[:formatted_address])).serializable_hash
  end
end
