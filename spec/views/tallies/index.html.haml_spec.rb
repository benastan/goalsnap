require 'spec_helper'

describe "tallies/index" do
  before(:each) do
    assign(:tallies, [
      stub_model(Tally,
        :axis_type => "Axis Type",
        :axis_id => 1,
        :user_id => 2,
        :has_been_spent => false
      ),
      stub_model(Tally,
        :axis_type => "Axis Type",
        :axis_id => 1,
        :user_id => 2,
        :has_been_spent => false
      )
    ])
  end

  it "renders a list of tallies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Axis Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
