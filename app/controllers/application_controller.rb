class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  include SessionsHelper

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized?
    if current_user == User.find(params[:id])
      @user = User.find(params[:id])
    else
      flash[:error] = "You are not authorized to view this page!"
      redirect_to posts_path
    end
  end
end
