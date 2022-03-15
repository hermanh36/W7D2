class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    login
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    @user = nil
    redirect_to new_session_url
  end

end