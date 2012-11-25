require 'spec_helper'

describe SessionsController do
  let (:user) { FactoryGirl.create(:user) }

  context 'user enters the wrong credententials' do
    it 'redirects to the login form' do
      post :create
      should redirect_to login_path
    end
  end

  context 'user enters credentials on the login page' do
    it 'logs the user in' do
      controller.should_receive(:set_current_user).with(user)
      post :create, :email => user.email
      should redirect_to root_path
    end
  end

  context 'user navigates to log out page' do
    it 'logs the user out' do
      controller.should_receive(:set_current_user).with(nil)
      post :delete
      should redirect_to root_path
    end
  end
end
