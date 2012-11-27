class User < ActiveRecord::Base
  attr_accessible :email, :first_name
  validates_presence_of :email, :first_name
  has_many :goal_rewards
  has_many :tallies

  def admin?
    self.email == 'bennyjbergstein@gmail.com'
  end

  def goals
    goal_rewards.collect { |gr| gr.goal }
  end

  def rewards
    goal_rewards.collect { |gr| gr.reward }
  end
end
