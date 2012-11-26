require 'spec_helper'

describe GoalRewardsController do
  describe '#index' do
    context 'unauthenticated user' do
      it 'redirects to root path' do
        get :index
        should redirect_to login_path
      end
    end

    context 'authenticated user' do
      let (:user) { FactoryGirl.create(:user) }
      it 'renders the index page' do
        controller.send(:set_current_user, user)
        get :index
        assigns[:goal_rewards].should == user.goal_rewards
      end
    end
  end

  describe '#create'
  describe '#new'
  describe '#destroy'
end
