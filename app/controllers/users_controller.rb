class UsersController < ApplicationController

  def show
    @user = current_user
   #byebug
  end

  def edit
    @user = current_user

  end

  def update

  end

  def index
    @user = User.find(params[:id])
    @recipe = @user.recipes
  end
  private

  def users_params
    params.require(:user).permit(:name, :images)
  end
end
