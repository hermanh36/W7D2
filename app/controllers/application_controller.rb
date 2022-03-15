class ApplicationController < ActionController::Base
  
  helper_method :logged_in?, :current_user


  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    user = current_user
    if user 
      return true
    end
    return false
  end

  def login 
    user = User.find_by_credentials(params[:users][:email],params[:users][:password])
    if user
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to user_url(user.id)
    else
      redirect_to new_session_url
    end
  end

end
