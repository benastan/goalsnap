class AddRewardCountToGoalReward < ActiveRecord::Migration
  def change
    add_column :goal_rewards, :reward_count, :integer
  end
end
