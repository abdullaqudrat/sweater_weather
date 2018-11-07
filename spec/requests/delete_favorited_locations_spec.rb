require "rails_helper"

describe "delete favorites api" do
  it "logged in user can delete favorite location by favorites api end point" do
    favorite_1 = Favorite.create(location: "Denver, CO, USA")
    favorite_2 = Favorite.create(location: "Los Angeles, CA, USA")
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", favorites: [favorite_1, favorite_2])

    post '/api/v1/sessions', headers: {"email": "#{user.email}", "password": "#{user.password}"}

    expect(response).to be_successful

    login_response = JSON.parse(response.body)
    login_api_key = login_response['api_key']

    delete "/api/v1/favorites", headers: {'api_key': login_api_key, 'location': favorite_1.location}

    expect(response).to be_successful

    deleted_favorite_response = JSON.parse(response.body)

    expect(deleted_favorite_response).to be_a(Array)
    expect(deleted_favorite_response[0]).to be_a(Hash)
    expect(deleted_favorite_response[0]).to have_key('data')
    expect(deleted_favorite_response[0]['data']).to have_key('attributes')
    expect(deleted_favorite_response[0]['data']['attributes']).to have_key('location')
    expect(deleted_favorite_response[0]['data']['attributes']['location']).to eq(favorite_2.location)
    expect(deleted_favorite_response[1]).to eq(nil)
  end
  it "logged in user cannot delete favorite locations by favorites api end point with NO API KEY" do
    favorite_1 = Favorite.create(location: "Denver, CO, USA")
    favorite_2 = Favorite.create(location: "Los Angeles, CA, USA")
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", favorites: [favorite_1, favorite_2])

    post '/api/v1/sessions', headers: {"email": "#{user.email}", "password": "#{user.password}"}

    expect(response).to be_successful

    login_response = JSON.parse(response.body)
    login_api_key = login_response['api_key']

    delete "/api/v1/favorites"

    expect(response.status).to eq(401)
  end
  it "logged in user cannot delete non favorited location by favorites api end point" do
    favorite_1 = Favorite.create(location: "Denver, CO, USA")
    favorite_2 = Favorite.create(location: "Los Angeles, CA, USA")
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password", favorites: [favorite_1])

    post '/api/v1/sessions', headers: {"email": "#{user.email}", "password": "#{user.password}"}

    expect(response).to be_successful

    login_response = JSON.parse(response.body)
    login_api_key = login_response['api_key']

    delete "/api/v1/favorites", headers: {'api_key': login_api_key, 'location': favorite_2.location}

    expect(response.status).to eq(400)
  end
end
