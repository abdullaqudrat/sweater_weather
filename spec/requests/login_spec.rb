require "rails_helper"

describe "login API endpoint" do
  it "user can login posting to login ep" do
    user = User.create(email: "whatever@example.com", "password": "password", "password_confirmation": "password")

    post '/api/v1/sessions', headers: {"email": "#{user.email}", "password": "#{user.password}"}

    expect(response.status).to eq(200)

    login_response = JSON.parse(response.body)

    expect(login_response).to be_a(Hash)
    expect(login_response).to have_key('api_key')
    expect(login_response['api_key']).to_not be(nil)
  end
end
