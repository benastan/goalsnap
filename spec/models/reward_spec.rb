require 'spec_helper'

describe Reward do
  it 'has many goal rewards' do
    should have_many :goal_rewards
  end

  it 'has many tallies' do
    should have_many :tallies
  end

  context 'adding a tally to a reward' do
    let (:reward) { FactoryGirl.create(:reward) }
    let (:tally) { FactoryGirl.create(:tally) }
    it 'sets the tally\'s axis to the reward' do
      tally.axis = reward
      tally.save
      reward.tallies.include?(tally).should == true
    end
  end
end
