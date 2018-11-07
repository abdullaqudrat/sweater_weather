class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request

  def create
    user = User.new(email: request.headers[:email], password: request.headers[:password], password_confirmation: request.headers[:password_confirmation])
    if user.save
      command = AuthenticateUser.call(user.email, user.password)
      render json: { api_key: command.result }, status: 201
    else
      render json: { error: "not created" }, status: 403
    end
  end
end
