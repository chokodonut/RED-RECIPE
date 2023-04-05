class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user

  end
  
  def update
    
  end
  
  private

  def users_params
    params.require(:user).permit(:name, :image)
  end
end
