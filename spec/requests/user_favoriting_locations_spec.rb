require "rails_helper"

describe "POST favorites api" do
  it "logged in user can favorite location by favorites api end point" do
    user = User.create(email: "whatever@example.com", "password": "password", "password_confirmation": "password")
    city = "Denver, CO, USA"

    post '/api/v1/sessions', headers: {"email": "#{user.email}", "password": "#{user.password}"}

    expect(response).to be_successful

    login_response = JSON.parse(response.body)
    login_api_key = login_response['api_key']

    post "/api/v1/favorites", headers: {'location': city, 'api_key': login_api_key}

    expect(response).to be_successful

    favorite_response = JSON.parse(response.body)

    expect(favorite_response).to have_key('location')
    expect(favorite_response['location']).to eq(city)
  end
  xit "user cannot favorite location twice with favorites api end point" do
    user = User.create(email: "whatever@example.com", "password": "password", "password_confirmation": "password")
    city = "Denver, CO, USA"

    post '/api/v1/sessions', headers: {"email": "#{user.email}", "password": "#{user.password}"}

    expect(response).to be_successful

    login_response = JSON.parse(response.body)
    login_api_key = login_response['api_key']

    post "/api/v1/favorites", headers: {'location': city, 'api_key': login_api_key}

    expect(response).to be_successful

    favorite_response = JSON.parse(response.body)

    expect(favorite_response).to have_key('location')
    expect(favorite_response['location']).to eq(city)

    post "/api/v1/favorites", headers: {'location': city, 'api_key': login_api_key}

    expect(response.status).to eq(400)
  end
  it "user cannot favorite location by favorites api end point without api key" do
    user = User.create(email: "whatever@example.com", "password": "password", "password_confirmation": "password")
    city = "Denver, CO, USA"

    post '/api/v1/sessions', headers: {"email": "#{user.email}", "password": "#{user.password}"}

    expect(response).to be_successful

    login_response = JSON.parse(response.body)
    login_api_key = login_response['api_key']

    post "/api/v1/favorites", headers: {'location': city}

    expect(response.status).to eq(401)
  end
  it "user cannot favorite location by favorites api end point without location" do
    user = User.create(email: "whatever@example.com", "password": "password", "password_confirmation": "password")
    city = "Denver, CO, USA"

    post '/api/v1/sessions', headers: {"email": "#{user.email}", "password": "#{user.password}"}

    expect(response).to be_successful

    login_response = JSON.parse(response.body)
    login_api_key = login_response['api_key']

    post "/api/v1/favorites", headers: {'api_key': login_api_key}

    expect(response.status).to eq(400)
  end
end
