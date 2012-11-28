class Reward < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :goal_rewards, :dependent => :destroy
  has_many :tallies, :as => :axis
end
