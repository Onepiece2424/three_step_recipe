class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorite_recipes = @user.favorite_recipes.includes(:user).order(:updated_at, :created_at).reverse_order
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
