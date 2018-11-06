require "rails_helper"

describe "account creation api" do
  it "POST /api/v1/users" do

    post '/api/v1/users', headers: {"email": "whatever@example.com", "password": "password", "password_confirmation": "password"}

    expect(response.status).to eq(200)

    new_account = JSON.parse(response.body)

    expect(new_account).to be_a(Hash)
    expect(new_account).to have_key('api_key')
  end
end
