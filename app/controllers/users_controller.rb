class UsersController < ApplicationController
  def show
    @user = User.with_attached_avatar.find(params[:id])
    @favorite_recipes = @user.favorite_recipes.with_attached_images.includes(:user, :images_attachments).order(:updated_at, :created_at).reverse_order
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:avatar)
  end
end
