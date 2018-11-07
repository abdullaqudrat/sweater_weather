class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :forecast
  attributes :id, :location, :current_time, :current_temp, :current_feels_like, :current_summary, :later_summary, :current_humidity, :current_visibility, :current_uv_index, :daily, :hourly

  attribute :current_time do |object|
    Time.at(object.current_time).strftime('%l:%M %p')
  end

  attribute :current_humidity do |object|
    "#{(object.current_humidity * 100.0).round}%"
  end

end
