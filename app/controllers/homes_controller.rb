class HomesController < ApplicationController
  def top
    @recipe = Recipe.order('id DESC').limit(8)
  end
end
