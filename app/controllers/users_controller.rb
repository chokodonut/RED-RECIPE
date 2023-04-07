class UsersController < ApplicationController
 before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @user = current_user
   #byebug
  end

  def edit
    @user = current_user

  end

  def update
    @user = current_user
    @user.update(users_params)
    redirect_to my_page_path
  end

  def index
    @user = User.find(params[:id])
    @recipe = @user.recipes
  end
  
  def is_matching_login_user
    @user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end
  private

  def users_params
    params.require(:user).permit(:name, :image)
  end
end
