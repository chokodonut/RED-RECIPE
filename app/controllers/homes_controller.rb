class HomesController < ApplicationController
  def top
    @recipe = Recipe.all
  end
end
