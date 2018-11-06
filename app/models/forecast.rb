class Forecast

  attr_reader :id, :location, :current_time, :current_temp, :current_feels_like, :current_summary, :later_summary, :current_humidity, :current_visibility, :current_uv_index, :daily, :hourly

  def initialize(weather, location=nil)
    current = weather[:currently]
    @location = location
    @current_time = current[:time] #epoch time
    @current_temp = current[:temperature] #farenheit
    @current_feels_like = current[:apparentTemperature] #farenheit
    @current_summary = current[:summary]
    @later_summary = weather[:hourly][:summary]
    @current_humidity = current[:humidity] #decimal
    @current_visibility = current[:visibility] #miles
    @current_uv_index = current[:uvIndex] #scale
    @raw_hourly_array = weather[:hourly][:data]
    @raw_daily_array = weather[:daily][:data]
    @daily = []
    @hourly = []
    get_daily
    get_hourly
  end

  def get_daily
    @raw_daily_array.each do |daily_data|
      @daily << Daily.new(daily_data)
    end
  end

  def get_hourly
    @raw_hourly_array.each do |hourly_data|
      @hourly << Hourly.new(hourly_data)
    end
  end

end
