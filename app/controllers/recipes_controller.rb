class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:top]

  def index
  end

  def new
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
