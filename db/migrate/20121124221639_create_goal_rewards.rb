class CreateGoalRewards < ActiveRecord::Migration
  def change
    create_table :goal_rewards do |t|
      t.integer :goal_id
      t.integer :reward_id
      t.integer :user_id

      t.timestamps
    end
  end
end
