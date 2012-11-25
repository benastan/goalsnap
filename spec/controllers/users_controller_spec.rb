require 'spec_helper'

describe UsersController do
  describe '#show' do
    context 'unauthenticated user' do
      it 'redirects to the login page' do
        get :show
        should redirect_to login_path
      end
    end

    context 'authenticated user' do
      let (:user) { FactoryGirl.create(:user) }
      before (:each) { controller.send(:set_current_user, user) }

      it 'renders the show page' do
        get :show
        should render_template :show
      end
    end
  end
end
