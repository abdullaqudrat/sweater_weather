require "rails_helper"

describe "get favorites api" do
  it "logged in user can get favorite location by favorites api end point" do
    favorite_1 = Favorite.create(location: "Denver, CO, USA")
    favorite_2 = Favorite.create(location: "Los Angeles, CO, USA")
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", favorites: [favorite_1, favorite_2])

    post '/api/v1/sessions', headers: {"email": "#{user.email}", "password": "#{user.password}"}

    expect(response).to be_successful

    login_response = JSON.parse(response.body)
    login_api_key = login_response['api_key']

    get "/api/v1/favorites", headers: {'api_key': login_api_key}

    expect(response).to be_successful

    favorite_response = JSON.parse(response.body)
binding.pry
    expect(favorite_response).to be_a(Array)
    expect(favorite_response[0]).to be_a(Hash)
    expect(favorite_response[0]).to have_key('location')
    expect(favorite_response['location']).to eq(favorite_1)
  end
end
