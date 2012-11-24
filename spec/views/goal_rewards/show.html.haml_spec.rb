require 'spec_helper'

describe "goal_rewards/show" do
  before(:each) do
    @goal_reward = assign(:goal_reward, stub_model(GoalReward,
      :goal_id => 1,
      :reward_id => 2,
      :user_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
