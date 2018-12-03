class Hourly

  def initialize(hourly_weather)
    hourly = hourly_weather
    @hour = hourly[:time] #epoch time
    @icon = hourly[:icon] #description
    @summary = hourly[:summary]
    @temp = hourly[:temperature] #farenheit
    @chance_of_precipitation = hourly[:precipProbability]
  end

end
