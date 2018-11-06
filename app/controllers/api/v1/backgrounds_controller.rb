class Api::V1::BackgroundsController < ApplicationController

  def show
    render json: BackgroundsFacade.new(params[:location]).retrieve_image_links
  end

end
