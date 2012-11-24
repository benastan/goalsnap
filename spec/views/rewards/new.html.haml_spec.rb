require 'spec_helper'

describe "rewards/new" do
  before(:each) do
    assign(:reward, stub_model(Reward,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new reward form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rewards_path, :method => "post" do
      assert_select "input#reward_title", :name => "reward[title]"
      assert_select "textarea#reward_description", :name => "reward[description]"
    end
  end
end
