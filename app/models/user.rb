class User < ActiveRecord::Base
  attr_accessible :email, :first_name
  validates_presence_of :email, :first_name
end
