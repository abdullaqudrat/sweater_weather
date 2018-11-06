class Hourly

  def initialize(hourly_weather)
    hourly = hourly_weather
    @hour = Time.at(hourly[:time]).strftime('%-I %P') #epoch time
    @summary = hourly[:summary]
    @temp = hourly[:temperature] #farenheit
    @chance_of_precipitation = hourly[:precipProbability]
  end

end
