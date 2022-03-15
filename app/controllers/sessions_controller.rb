class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    login
  end

  def destroy
    @user.reset_session_token
    session[:session_token] = nil
    @user = nil
  end

end