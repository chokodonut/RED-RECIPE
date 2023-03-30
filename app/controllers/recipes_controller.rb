class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    recipe.save

  end

  def index
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :time, :hot_level)
  end
end
