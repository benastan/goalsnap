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

  def must_be_admin
    redirect_to home_path unless current_user.admin?
  end

  def home_path
    if current_user
      user_goal_rewards_path(current_user)
    else
      login_path
    end
  end
  helper_method :home_path
end
