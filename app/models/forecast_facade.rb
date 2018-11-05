class ForecastFacade

  def initialize(location)
    @location = location
  end

  def get_forecast
    coordinates = GeocodeService.new(@location).get_coordinates
    WeatherService.new(coordinates).get_weather
  end

end
