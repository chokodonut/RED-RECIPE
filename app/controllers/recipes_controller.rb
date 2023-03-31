class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user_id
    @materials = Material.new
    @steps = Step.new

    recipe.save
    redirect_to recipe_path
  end

  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @material = Material.find(params[:id])
    @step = Step.find(params[:id])
  end
  private

  def recipe_params
    params.require(:recipe).permit(:title, :time, :hot_level, :image, :description, :content, :step_no, :quantity, :name)
  end
end
