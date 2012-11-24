require "spec_helper"

describe GoalRewardsController do
  describe "routing" do

    it "routes to #index" do
      get("/goal_rewards").should route_to("goal_rewards#index")
    end

    it "routes to #new" do
      get("/goal_rewards/new").should route_to("goal_rewards#new")
    end

    it "routes to #show" do
      get("/goal_rewards/1").should route_to("goal_rewards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/goal_rewards/1/edit").should route_to("goal_rewards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/goal_rewards").should route_to("goal_rewards#create")
    end

    it "routes to #update" do
      put("/goal_rewards/1").should route_to("goal_rewards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/goal_rewards/1").should route_to("goal_rewards#destroy", :id => "1")
    end

  end
end
