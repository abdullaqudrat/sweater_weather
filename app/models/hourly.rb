class Hourly

  def initialize(hourly_weather)
    hourly = hourly_weather
    @hour = Time.at(hourly[:time]).strftime('%l %p') #epoch time
    @icon = hourly[:icon] #description
    @summary = hourly[:summary]
    @temp = hourly[:temperature] #farenheit
    @chance_of_precipitation = hourly[:precipProbability]
  end

end
