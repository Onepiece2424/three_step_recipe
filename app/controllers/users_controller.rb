class UsersController < ApplicationController
  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.create(user_params)
  #   redirect_to root_path
  # end

  def show
    @user = User.find(params[:id])
    @favorite_recipes = @user.favorite_recipes.order(:updated_at, :created_at).reverse_order
  end

  # private

  # def user_params
  #   params.require(:user).permit(:avatar)
  # end
end
