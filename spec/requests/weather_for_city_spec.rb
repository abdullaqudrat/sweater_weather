require "rails_helper"

describe "weather for city API endpoint" do
  it "request will return JSON of weather for a city" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    weather = JSON.parse(response.body)

    expect(weather).to be_a(Hash)
    expect(weather).to have_key(:data)
    expect(weather[:data]).to have_key(:location)
    expect(weather[:data][:location]).to eq('Denver, CO')
    expect(weather[:data]).to have_key(:weather)
  end
end
