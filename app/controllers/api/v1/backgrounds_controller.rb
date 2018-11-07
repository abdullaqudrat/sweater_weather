class Api::V1::BackgroundsController < ApplicationController
  skip_before_action :authenticate_request

  def show
    render json: BackgroundsFacade.new(params[:location]).return_random_image
  end

end
