class GoalReward < ActiveRecord::Base
  attr_accessible :goal_id, :reward_id, :user_id, :goal_count, :reward_count
  has_many :tallies, :dependent => :destroy
  belongs_to :goal
  belongs_to :reward
  belongs_to :user

  validates_presence_of :goal_id, :reward_id, :user_id

  def times_redeemed
    self.tallies.goals.spent / goal_count
  end

  def rewards_spent
    self.tallies.rewards.spent
  end

  def unspent_rewards
    tallies.rewards.not_spent
  end

  def goals_recorded
    user.tallies.goals.not_spent.where(:axis_id => goal_id).count
  end

  def reward_available?
    available_rewards > 0
  end

  def available_rewards
    (goals_recorded / goal_count) * reward_count
  end

  def goals_to_reward
    goal_count - (goals_recorded - (goals_recorded / goal_count.to_f).floor * goal_count)
  end

  def redeem_reward redeem_count = 1
    goal_tallies = user.tallies.not_spent.where(:axis_id => goal_id)[0..goal_count-1]
    goal_tallies.each do |t|
      t.spend self
    end
    reward_tallies = (1..reward_count-1).collect do |index|
      t = user.tallies.new
      t.axis = reward
      t.update_attribute :goal_reward_id, self.id
      t.spend self if index < redeem_count or redeem_count == -1
      reward
    end
  end

  def spend_reward redeem_count = 1
    unspent_rewards[0..redeem_count-1].each { |r| r.spend }
  end
end
