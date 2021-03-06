require 'spec_helper'

describe "goals/new" do
  before(:each) do
    assign(:goal, stub_model(Goal,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new goal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => goals_path, :method => "post" do
      assert_select "input#goal_title", :name => "goal[title]"
      assert_select "textarea#goal_description", :name => "goal[description]"
    end
  end
end
