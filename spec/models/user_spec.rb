require 'spec_helper'

describe User do
  it 'validates a bunch of shit' do
    should validate_presence_of :email
    should validate_presence_of :first_name
  end

  it 'has many goal rewards' do
    should have_many :goal_rewards
  end
end
