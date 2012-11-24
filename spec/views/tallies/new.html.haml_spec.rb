require 'spec_helper'

describe "tallies/new" do
  before(:each) do
    assign(:tally, stub_model(Tally,
      :axis_type => "MyString",
      :axis_id => 1,
      :user_id => 1,
      :has_been_spent => false
    ).as_new_record)
  end

  it "renders new tally form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tallies_path, :method => "post" do
      assert_select "input#tally_axis_type", :name => "tally[axis_type]"
      assert_select "input#tally_axis_id", :name => "tally[axis_id]"
      assert_select "input#tally_user_id", :name => "tally[user_id]"
      assert_select "input#tally_has_been_spent", :name => "tally[has_been_spent]"
    end
  end
end
