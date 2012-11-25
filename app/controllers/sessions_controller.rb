class SessionsController < ApplicationController
  def create
    user = User.find_by_email params[:email] rescue nil
    if user
      set_current_user user
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def delete
    set_current_user nil
    redirect_to root_path
  end
end
