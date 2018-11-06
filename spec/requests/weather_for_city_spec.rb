require "rails_helper"

describe "weather for city API endpoint" do
  it "request will return JSON of weather for a city" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    weather = JSON.parse(response.body)

    expect(weather).to be_a(Hash)
    expect(weather).to have_key('data')
    expect(weather['data']).to have_key('attributes')
    expect(weather['data']['attributes']).to have_key('location')
    expect(weather['data']['attributes']['location']).to eq('Denver, CO, USA')
    expect(weather['data']).to have_key('type')
    expect(weather['data']['type']).to eq('forecast')
  end
end
