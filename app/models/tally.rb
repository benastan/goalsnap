class Tally < ActiveRecord::Base
  attr_accessible :axis_id, :axis_type, :has_been_spent, :user_id, :goal_reward_id
  belongs_to :user
  belongs_to :goal_reward
  belongs_to :axis, :polymorphic => true

  validates_presence_of :user_id, :axis_id, :axis_type
  before_create :default_values
  before_save {
    if has_been_spent && !goal_reward_id
      false
    else
      true
    end
  }

  scope :rewards, where(:axis_type => 'Reward')
  scope :goals, where(:axis_type => 'Goal')
  scope :spent, where(:has_been_spent => true)
  scope :not_spent, where(:has_been_spent => false)

  def spend gr = goal_reward
    update_attributes(
      :has_been_spent => true,
      :goal_reward_id => gr.id
    ) if gr
  end

  def default_values
    self.has_been_spent ||= false
    true
  end

  def reward?
    axis_type == 'Reward'
  end

  def goal?
    axis_type == 'Goal'
  end

  VALID_AXES = [ Reward, Goal ]
  AXIS_COLLECTION = VALID_AXES.collect do |model|
    model.all
  end
end
