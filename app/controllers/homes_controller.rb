class HomesController < ApplicationController
  def top
    @recipe = Recipe.order('id DESC').limit(4)
  end
end
