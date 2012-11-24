class GoalReward < ActiveRecord::Base
  attr_accessible :goal_id, :reward_id, :user_id
end
