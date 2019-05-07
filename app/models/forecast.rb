class Forecast

  attr_reader :id, :location, :current_icon, :current_time, :current_date, :current_temp, :current_high, :current_low, :current_feels_like, :current_summary, :later_summary, :current_humidity, :current_visibility, :current_uv_index, :daily, :hourly

  def initialize(weather, location=nil)
    current = weather[:currently]
    today = weather[:daily][:data][0]
    @location = location
    Time.zone = weather[:timezone]
    @server_time_difference = Time.now.utc_offset
    @city_time_difference = Time.current.utc_offset
    @time_difference = @server_time_difference - @city_time_difference
    @current_time = Time.at(current[:time] - @time_difference).strftime('%I:%M %p') #epoch time
    @current_date = Time.at(current[:time] - @time_difference).strftime('%A, %b %d') #epoch time
    @current_icon = current[:icon] #description
    @current_temp = current[:temperature] #farenheit
    @current_high = today[:temperatureHigh]
    @current_low = today[:temperatureLow]
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
      @daily << Daily.new(daily_data, @time_difference)
    end
  end

  def get_hourly
    @raw_hourly_array.each do |hourly_data|
      @hourly << Hourly.new(hourly_data, @time_difference)
    end
  end

end
