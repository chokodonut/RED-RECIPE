class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  before_action :authenticate_user!, only: [:show, :my_page]

  def show
    @user = User.find(params[:id])
    #byebug
  end

  def my_page
  end

  def report
    @user = current_user
    @report = @user.reports

  end

  def book_marks
    @user = current_user
    @book_marks = BookMark.where(user_id: current_user.id).pluck(:recipe_id)
    @book_marks_recipe = Recipe.find(@book_marks)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(users_params)
    redirect_to my_page_path, notice: 'プロフィールが編集されました。'
  end

  def recipe_index
    @user = User.find(params[:id])
    @recipe = @user.recipes
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def is_matching_login_user
     @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to root_path, notice: '不正なアクセスです'
    end
  end

  def ensure_guest_user
    @user = current_user
    #binding.pry
    if @user.name == "ゲスト"
      redirect_to my_page_path , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :image, :id)
  end
end
