class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  private
  def require_login
    unless session[:user_id]
      flash[:notice] = ["You must login to do that"]
      redirect_to '/'
    end
  end
end
