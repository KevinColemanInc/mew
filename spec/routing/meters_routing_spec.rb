require "spec_helper"

describe MetersController do
  describe "routing" do

    it "routes to #index" do
      get("/meters").should route_to("meters#index")
    end

    it "routes to #new" do
      get("/meters/new").should route_to("meters#new")
    end

    it "routes to #show" do
      get("/meters/1").should route_to("meters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/meters/1/edit").should route_to("meters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/meters").should route_to("meters#create")
    end

    it "routes to #update" do
      put("/meters/1").should route_to("meters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/meters/1").should route_to("meters#destroy", :id => "1")
    end

  end
end
