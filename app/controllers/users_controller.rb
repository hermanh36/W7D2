class UsersController < ApplicationController
  
  def new
    if !logged_in?
      @user = User.new
      render :new
    else
      @user = current_user
      redirect_to user_url(@user.id)
    end
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      login
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = current_user
      render :show
    else
      redirect_to new_session_url
    end
  end

  def user_params
    params.require(:users).permit(:email,:password)
  end
end