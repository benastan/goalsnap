class User < ActiveRecord::Base
  attr_accessible :email, :first_name
  validates_presence_of :email, :first_name
  has_many :goal_rewards, :dependent => :destroy
  has_many :tallies, :dependent => :destroy

  def admin?
    self.email == 'bennyjbergstein@gmail.com'
  end

  def goals
    goal_rewards.collect { |gr| gr.goal }
  end

  def rewards
    goal_rewards.collect { |gr| gr.reward }
  end

  def available_rewards
    goal_rewards.map { |gr| gr.available_rewards }.reduce { |a, b| a + b }
  end
end
