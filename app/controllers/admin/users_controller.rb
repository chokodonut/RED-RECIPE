class Admin::UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @recipe = @user.recipes
  end
end
