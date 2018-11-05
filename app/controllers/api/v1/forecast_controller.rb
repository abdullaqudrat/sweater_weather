class Api::V1::ForecastController < ApplicationController

  def show
    render json: {data: {location: params[:location], weather: 'some_weather'}}
  end

end
