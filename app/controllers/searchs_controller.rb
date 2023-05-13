class SearchsController < ApplicationController

  def search
    @range = params[:range]
    @keyword = params[:keyword]
    @genre_id = params[:genre_id]
    if @range == "Recipe"
      @recipes = Recipe.recipes_search(@keyword)
    elsif @genre_id.present?
      @range = "Recipe"
      @recipes = Genre.recipes_search(@genre_id)
      @keyword = Genre.find(@genre_id).name
    else
      @users = User.users_search(@keyword)
    end
  end
end
