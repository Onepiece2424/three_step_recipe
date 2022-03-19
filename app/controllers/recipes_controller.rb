class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :set_q, only: [:index, :search]
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.with_attached_images.order(:updated_at,:created_at).reverse_order
    @my_recipes = current_user.recipes.order(:updated_at,:created_at).reverse_order
  end

  def search
    @results = @q.result
    @my_results = @my_q.result
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @comments = @recipe.comments
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def top
  end

  def recipe_params
    params.require(:recipe).permit(:title,:process1,:process2,:process3, images: [])
  end

  def set_q
    @q = Recipe.ransack(params[:q])
    @my_q = current_user.recipes.ransack(params[:q])
  end

  def ensure_user
    @recipes = current_user.recipes
    @recipe = @recipes.find_by(id: params[:id])
    redirect_to recipes_path unless @recipe
  end
end
