class HomesController < ApplicationController
  def top
    @recipe = Recipe.order('id DESC').limit(9)
    @genres = Genre.all
  end
end
