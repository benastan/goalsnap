require 'spec_helper'

describe "goal_rewards/index" do
  before(:each) do
    assign(:goal_rewards, [
      stub_model(GoalReward,
        :goal_id => 1,
        :reward_id => 2,
        :user_id => 3
      ),
      stub_model(GoalReward,
        :goal_id => 1,
        :reward_id => 2,
        :user_id => 3
      )
    ])
  end

  it "renders a list of goal_rewards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
