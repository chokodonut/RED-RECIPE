class RecipesController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
 
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

  def edit
    @user = current_user
    @recipe = Recipe.find(params[:id])

  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe.id)
  end

  def is_matching_login_user
    @user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(:time, :hot_level, :image, :description, :genre_id, :title,
    materials_attributes: [:id, :name, :quantity, :_destroy], steps_attributes: [:id, :step_no, :content, :_destroy, images: []])
  end
end
