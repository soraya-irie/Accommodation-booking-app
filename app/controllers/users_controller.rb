class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_users_path
    else
      render :profile_edit
    end
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
  params.require(:user).permit(:name, :email, :self_introduction, :icon_image, :encrypted_password)
end