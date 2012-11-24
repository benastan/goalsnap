require 'spec_helper'

describe Reward do
  it 'has many goal rewards' do
    should have_many :goal_rewards
  end
end
