require "spec_helper"

describe CaseManagersController do
  describe "routing" do

    it "routes to #index" do
      get("/case_managers").should route_to("case_managers#index")
    end

    it "routes to #new" do
      get("/case_managers/new").should route_to("case_managers#new")
    end

    it "routes to #show" do
      get("/case_managers/1").should route_to("case_managers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/case_managers/1/edit").should route_to("case_managers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/case_managers").should route_to("case_managers#create")
    end

    it "routes to #update" do
      put("/case_managers/1").should route_to("case_managers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/case_managers/1").should route_to("case_managers#destroy", :id => "1")
    end

  end
end
