class Daily

  def initialize(daily_weather, time_difference)
    daily = daily_weather
    @day = Time.at(daily[:time] - time_difference).strftime('%A') #epoch time
    @icon = daily[:icon] #description
    @summary = daily[:summary]
    @high_temp = daily[:temperatureHigh] #farenheit
    @low_temp = daily[:temperatureLow] #farenheit
    @chance_of_precipitation = daily[:precipProbability] #farenheit
  end

end
