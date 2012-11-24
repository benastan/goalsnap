require 'spec_helper'

describe "goal_rewards/new" do
  before(:each) do
    assign(:goal_reward, stub_model(GoalReward,
      :goal_id => 1,
      :reward_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new goal_reward form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => goal_rewards_path, :method => "post" do
      assert_select "input#goal_reward_goal_id", :name => "goal_reward[goal_id]"
      assert_select "input#goal_reward_reward_id", :name => "goal_reward[reward_id]"
      assert_select "input#goal_reward_user_id", :name => "goal_reward[user_id]"
    end
  end
end
