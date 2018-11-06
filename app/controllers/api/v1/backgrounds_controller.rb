class Api::V1::BackgroundsController < ApplicationController

  def show
    render json: BackgroundsFacade.new(params[:location]).return_random_image
  end

end
