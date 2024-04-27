class UsersController < ApplicationController
  def index
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
  end

  def profile_edit
    @user = current_user
  end
end
