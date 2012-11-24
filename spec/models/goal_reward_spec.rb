require 'spec_helper'

describe GoalReward do
  it 'should validate a bunch of shit' do
    [:goal_id, :reward_id, :user_id].each do |id|
      subject.should validate_presence_of id
    end
  end

  it 'should belong to goal, reward and user' do
    [:goal, :reward, :user].each do |m|
      subject.should belong_to m
    end
  end
end
