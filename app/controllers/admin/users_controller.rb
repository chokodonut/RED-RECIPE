class Admin::UsersController < ApplicationController
  def index
    @user = User.page(params[:page])
    @recipe = @user.recipes
  end

  def show
    @user = User.find(params[:id])
  end

  def report
    @report = Report.page(params[:page])
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_root_path
  end
end
