class GoalReward < ActiveRecord::Base
  attr_accessible :goal_id, :reward_id, :user_id, :goal_count, :reward_count
  has_many :tallies
  belongs_to :goal
  belongs_to :reward
  belongs_to :user

  validates_presence_of :goal_id, :reward_id, :user_id
end
