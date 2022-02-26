class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def top
  end
end
