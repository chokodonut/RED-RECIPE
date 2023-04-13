class BookMarksController < ApplicationController

  def create
    @book_mark = current_user.book_marks.create(recipe_id: params[:recipe_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @book_mark = current_user.book_marks.find_by(recipe_id: @recipe.id)
    @book_mark.destroy
    redirect_back(fallback_location: root_path)
  end
end
