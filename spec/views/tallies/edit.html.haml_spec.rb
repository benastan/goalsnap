require 'spec_helper'

describe "tallies/edit" do
  before(:each) do
    @tally = assign(:tally, stub_model(Tally,
      :axis_type => "MyString",
      :axis_id => 1,
      :user_id => 1,
      :has_been_spent => false
    ))
  end

  it "renders the edit tally form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tallies_path(@tally), :method => "post" do
      assert_select "input#tally_axis_type", :name => "tally[axis_type]"
      assert_select "input#tally_axis_id", :name => "tally[axis_id]"
      assert_select "input#tally_user_id", :name => "tally[user_id]"
      assert_select "input#tally_has_been_spent", :name => "tally[has_been_spent]"
    end
  end
end
