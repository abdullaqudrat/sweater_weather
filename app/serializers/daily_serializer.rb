class DailySerializer
  include FastJsonapi::ObjectSerializer
  attributes :time

  attribute :time do |object|
    Time.at(object.time).strftime('%-I %P')
  end

  
end
