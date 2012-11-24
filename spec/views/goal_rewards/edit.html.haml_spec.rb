require 'spec_helper'

describe "goal_rewards/edit" do
  before(:each) do
    @goal_reward = assign(:goal_reward, stub_model(GoalReward,
      :goal_id => 1,
      :reward_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit goal_reward form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => goal_rewards_path(@goal_reward), :method => "post" do
      assert_select "input#goal_reward_goal_id", :name => "goal_reward[goal_id]"
      assert_select "input#goal_reward_reward_id", :name => "goal_reward[reward_id]"
      assert_select "input#goal_reward_user_id", :name => "goal_reward[user_id]"
    end
  end
end
