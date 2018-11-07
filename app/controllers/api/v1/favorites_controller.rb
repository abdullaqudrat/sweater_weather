class Api::V1::FavoritesController < ApplicationController

  def index
    render json: FavoritesFacade.new(@current_user.favorites).get_favorites_and_forecast
  end

  def create
    location = request.headers['location']
    favorite = @current_user.favorites.new(location: location)
    if favorite.save
      render json: {location: favorite.location}, status: 201
    else
      render json: {error: 'not favorited'}, status: 400
    end
  end

  def destroy
    location = request.headers['location']
    favorite = @current_user.favorites.find_by_location(location)
    if favorite
      favorite.destroy
      render json: FavoritesFacade.new(@current_user.favorites).get_favorites_and_forecast
    else
      render json: {error: 'favorite does not exist'}, status: 400
    end
  end

end
