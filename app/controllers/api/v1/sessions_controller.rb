class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_request

  def create
  command = AuthenticateUser.call(request.headers[:email], request.headers[:password])
    if command.success?
      render json: { api_key: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

end
