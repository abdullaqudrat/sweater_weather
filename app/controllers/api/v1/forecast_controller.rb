class Api::V1::ForecastController < ApplicationController

  def show
    forecast = ForecastFacade.new(params[:location]).get_forecast
    # render json: {data: {location: params[:location], weather: 'some_weather'}}
  end

end
