class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @material = Material.new
    @step = Step.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    recipe_id = @recipe.id
    @materials = Material.new(material_params)
    @materials.recipe_id = recipe_id
    @steps = Step.new(step_params)
    @steps.recipe_id = recipe_id
    @materials.save
    @steps.save
    # byebug
    redirect_to recipe_path(recipe_id)
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
    params.require(:step).permit(:time, :hot_level, :image, :description, :genre_id, :title)
  end

  def material_params
    params.require(:step).permit(:quantity, :name)
  end

  def step_params
    params.require(:step).permit(:step_no, :content, :image)
  end
end
