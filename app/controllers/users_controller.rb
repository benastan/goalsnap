class UsersController < ApplicationController
  before_filter :must_be_logged_in
end
