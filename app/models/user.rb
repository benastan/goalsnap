class User < ActiveRecord::Base
  attr_accessible :email, :first_name
  validates_presence_of :email, :first_name
  has_many :goal_rewards
  has_many :tallies

end
