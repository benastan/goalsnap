require 'spec_helper'

describe "tallies/show" do
  before(:each) do
    @tally = assign(:tally, stub_model(Tally,
      :axis_type => "Axis Type",
      :axis_id => 1,
      :user_id => 2,
      :has_been_spent => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Axis Type/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
