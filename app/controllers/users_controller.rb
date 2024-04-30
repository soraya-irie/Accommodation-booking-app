class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end
  
  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def profile_edit
    @user = current_user
  end
end

def user_params
  params.requrei(:user).permit(:name, :email, :password_digest, :self_introduction, :icon-image, :created_at, :updated_at)
end