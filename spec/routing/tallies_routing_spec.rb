require "spec_helper"

describe TalliesController do
  describe "routing" do

    it "routes to #index" do
      get("/tallies").should route_to("tallies#index")
    end

    it "routes to #new" do
      get("/tallies/new").should route_to("tallies#new")
    end

    it "routes to #show" do
      get("/tallies/1").should route_to("tallies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tallies/1/edit").should route_to("tallies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tallies").should route_to("tallies#create")
    end

    it "routes to #update" do
      put("/tallies/1").should route_to("tallies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tallies/1").should route_to("tallies#destroy", :id => "1")
    end

  end
end
