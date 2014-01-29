require 'spec_helper'

describe "CommunicationDevices" do
  describe "GET /communication_devices" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get communication_devices_path
      response.status.should be(200)
    end
  end
end
