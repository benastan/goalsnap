class AddGoalCountToGoalReward < ActiveRecord::Migration
  def change
    add_column :goal_rewards, :goal_count, :integer
  end
end
