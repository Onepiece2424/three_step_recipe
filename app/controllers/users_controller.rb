class UsersController < ApplicationController
  def show
    @user = User.with_attached_avatar.find(params[:id])
    @favorite_recipes = @user.favorite_recipes.with_attached_images.includes(:user, :images_attachments).order(:updated_at, :created_at).reverse_order
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
