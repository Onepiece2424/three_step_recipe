class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(recipe_id: params[:recipe_id])
    favorite.save
    redirect_to recipes_path
  end

  def destroy
    favorite = Favorite.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    favorite.destroy
    redirect_to recipes_path
  end
end
