require 'spec_helper'

describe Goal do
  it 'has many goal rewards' do
    should have_many :goal_rewards
  end

  it 'has many tallies as axis' do
    should have_many :tallies
  end

  context 'adding a tally to a goal' do
    let (:goal) { FactoryGirl.create(:goal) }
    let (:tally) { FactoryGirl.create(:tally) }

    it 'sets the tally\'s axis to the goal' do
      tally.axis = goal
      tally.save
      goal.tallies.include?(tally).should == true
    end
  end
end
