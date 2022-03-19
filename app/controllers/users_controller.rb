class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorite_recipes = @user.favorite_recipes.order(:updated_at=>:desc,:created_at=>:desc)
  end
end
