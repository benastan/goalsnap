class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) rescue nil
  end
  helper_method :current_user

  def set_current_user user
    session[:user_id] = user.nil? ? nil : user.id
  end
  helper_method :set_current_user

  def must_be_logged_in
    redirect_to login_path unless current_user
  end
end
