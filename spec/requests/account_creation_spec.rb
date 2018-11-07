require "rails_helper"

describe "account creation api" do
  it "can create a new account" do

    post '/api/v1/users', headers: {"email": "whatever@example.com", "password": "password", "password_confirmation": "password"}

    expect(response.status).to eq(201)

    new_account = JSON.parse(response.body)

    expect(new_account).to be_a(Hash)
    expect(new_account).to have_key('api_key')
    expect(new_account['api_key']).to_not be(nil)
  end
  it "cannot create an already existing account" do
    User.create(email: "whatever@example.com", "password": "password", "password_confirmation": "password")

    post '/api/v1/users', headers: {"email": "whatever@example.com", "password": "password", "password_confirmation": "password"}

    expect(response.status).to eq(403)

    failed = JSON.parse(response.body)

    expect(failed['error']).to eq("not created")
  end
end
