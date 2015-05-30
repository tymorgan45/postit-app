class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user, :logged_in?

  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must be logged in to do that."
      redirect_to root_path
    end
  end

  def require_creator
    if @post.user_id != session[:user_id]
      flash[:error] = "You must be the creator of the post to do that"
      redirect_to root_path
    end
  end

  def user_same_as_profile
    if current_user != User.find(params[:id])
      flash[:error] = "You can't go there."
      redirect_to root_path
    end
  end
end
