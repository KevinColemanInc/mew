require "spec_helper"

describe CommunicationDevicesController do
  describe "routing" do

    it "routes to #index" do
      get("/communication_devices").should route_to("communication_devices#index")
    end

    it "routes to #new" do
      get("/communication_devices/new").should route_to("communication_devices#new")
    end

    it "routes to #show" do
      get("/communication_devices/1").should route_to("communication_devices#show", :id => "1")
    end

    it "routes to #edit" do
      get("/communication_devices/1/edit").should route_to("communication_devices#edit", :id => "1")
    end

    it "routes to #create" do
      post("/communication_devices").should route_to("communication_devices#create")
    end

    it "routes to #update" do
      put("/communication_devices/1").should route_to("communication_devices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/communication_devices/1").should route_to("communication_devices#destroy", :id => "1")
    end

  end
end
