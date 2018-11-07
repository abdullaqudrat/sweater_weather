class Api::V1::ForecastController < ApplicationController
  skip_before_action :authenticate_request

  def show
    render json: ForecastFacade.new(params[:location]).get_forecast
  end

end
