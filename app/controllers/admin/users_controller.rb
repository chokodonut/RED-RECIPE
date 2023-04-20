class Admin::UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @recipe = @user.recipes
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_root_path
  end
end