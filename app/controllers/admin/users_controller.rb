class Admin::UsersController < ApplicationController
  def recipe
    @user = User.find(params[:id])
    @recipe = @user.recipes
  end

  def show
    @user = User.find(params[:id])
  end

  def report
    @user = User.find(params[:id])
    @report = @user.reports
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_root_path, notice: "会員を削除しました。"
  end
end
