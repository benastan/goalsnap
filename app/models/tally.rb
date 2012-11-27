class Tally < ActiveRecord::Base
  attr_accessible :axis_id, :axis_type, :has_been_spent, :user_id, :goal_reward_id
  belongs_to :user
  belongs_to :goal_reward
  belongs_to :axis, :polymorphic => true

  validates_presence_of :user_id, :axis_id, :axis_type

  VALID_AXES = [ Reward, Goal ]
  AXIS_COLLECTION = VALID_AXES.collect do |model|
    model.all
  end
end
