class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorite_recipes = @user.favorite_recipes.order(:updated_at, :created_at).reverse_order
  end
end
