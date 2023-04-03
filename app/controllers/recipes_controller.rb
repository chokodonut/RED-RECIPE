class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @recipe.steps.build
    @recipe.materials.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save

    # byebug
    redirect_to recipe_path(@recipe.id)
  end

  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])

  end
  private

  def recipe_params
    params.require(:recipe).permit(:time, :hot_level, :image, :description, :genre_id, :title,
    materials_attributes: [:id, :name, :quantity, :_destroy], steps_attributes: [:id, :step_no, :content, :image, :_destroy])
  end
end
