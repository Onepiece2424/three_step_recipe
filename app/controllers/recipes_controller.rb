class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def index
    @recipes = Recipe.with_attached_images
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipes_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def top
  end

  def recipe_params
    params.require(:recipe).permit(:title,:process1,:process2,:process3, images: [])
  end
end
