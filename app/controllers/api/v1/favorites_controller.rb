class Api::V1::FavoritesController < ApplicationController

  def create
    location = request.headers['location']
    # forecast = ForecastFacade.new(location).get_forecast
    favorite = @current_user.favorites.new(location: location)
    if favorite.save
      render json: {location: favorite.location}, status: 201
    else
      render json: {error: 'not favorited'}, status: 400
    end
  end

end
