class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
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
    @user = User.find(params[:id])
    if @user
      render :show
    else
      redirect_to new_user_url
    end
  end

  def user_params
    params.require(:users).permit(:email,:password)
  end
end