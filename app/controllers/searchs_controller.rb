class SearchsController < ApplicationController

  def search
    @range = params[:range]
    @keyword = params[:keyword]
    if @range == "Recipe"
      @recipes = Recipe.recipes_search(@keyword)
    else
      @users = User.users_search(@keyword)
    end
  end
end
