class RecipesController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :authenticate_user!, only: [:show]


  def new
    @recipe = Recipe.new
    @recipe.steps.build
    @recipe.materials.build
    @recipe.steps.build
    @recipe.materials.build

  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = '投稿に成功しました。'
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
    # byebug
  end

  def index
    @recipe = Recipe.page(params[:page])
    @genres = Genre.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    is_matching_login_user
    @user = current_user
    @recipe = Recipe.find(params[:id])
  end

  def update
    is_matching_login_user
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
       flash[:notice] = '更新に成功しました。'
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:time, :hot_level, :image, :description, :genre_id, :title,
    materials_attributes: [:id, :name, :quantity, :_destroy], steps_attributes: [:id, :content, :_destroy, images: []])
  end

  def is_matching_login_user
    @recipe = Recipe.find(params[:id])
    #byebug
    unless @recipe.user.id == current_user.id
      redirect_to root_path, notice: "不正なアクセスです。"
    end
  end
end
