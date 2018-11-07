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
  it "user cannot login posting wrong email to login ep" do
    user = User.create(email: "whatever@example.com", "password": "password", "password_confirmation": "password")

    post '/api/v1/sessions', headers: {"email": "wrong_email@email.com", "password": "#{user.password}"}

    expect(response.status).to eq(401)

    login_response = JSON.parse(response.body)

    expect(login_response).to be_a(Hash)
    expect(login_response).to have_key('error')
    expect(login_response['error']).to have_key('user_authentication')
    expect(login_response['error']['user_authentication']).to eq(['invalid credentials'])
  end
  it "user cannot login posting wrong password to login ep" do
    user = User.create(email: "whatever@example.com", "password": "password", "password_confirmation": "password")

    post '/api/v1/sessions', headers: {"email": "#{user.email}", "password": "wrongpassword"}

    expect(response.status).to eq(401)

    login_response = JSON.parse(response.body)

    expect(login_response).to be_a(Hash)
    expect(login_response).to have_key('error')
    expect(login_response['error']).to have_key('user_authentication')
    expect(login_response['error']['user_authentication']).to eq(['invalid credentials'])
  end
  it "user cannot login to login ep without creating account first" do

    post '/api/v1/sessions', headers: {"email": "whatever@example.com", "password": "password"}

    expect(response.status).to eq(401)

    login_response = JSON.parse(response.body)

    expect(login_response).to be_a(Hash)
    expect(login_response).to have_key('error')
    expect(login_response['error']).to have_key('user_authentication')
    expect(login_response['error']['user_authentication']).to eq(['invalid credentials'])
  end
  it "user can create account and login posting to login ep and receive same api key" do
    user_email = "whatever@example.com"
    user_password = "password"

    post '/api/v1/users', headers: {"email": user_email, "password": user_password, "password_confirmation": user_password}

    expect(response.status).to eq(201)

    new_account = JSON.parse(response.body)
    account_create_api_key = new_account['api_key']

    post '/api/v1/sessions', headers: {"email": "#{user_email}", "password": "#{user_password}"}

    expect(response.status).to eq(200)

    login_response = JSON.parse(response.body)
    login_api_key = login_response['api_key']

    expect(login_api_key).to eq(account_create_api_key)
  end
end
