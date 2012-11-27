class AddGoalRewardIdToTally < ActiveRecord::Migration
  def change
    add_column :tallies, :goal_reward_id, :integer
  end
end
