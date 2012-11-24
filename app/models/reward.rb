class Reward < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :goal_rewards
  has_many :tallies, :as => :axis
end
