class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipes = Recipe.with_attached_images.order(created_at: :desc).limit(5)
  end
end
