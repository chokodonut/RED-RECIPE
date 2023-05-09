class Admin::RecipeController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to admin_root_path, notice: "レシピが削除されました。"
  end  
end
