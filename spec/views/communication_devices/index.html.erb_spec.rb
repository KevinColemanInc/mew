require 'spec_helper'

describe "communication_devices/index" do
  before(:each) do
    assign(:communication_devices, [
      stub_model(CommunicationDevice),
      stub_model(CommunicationDevice)
    ])
  end

  it "renders a list of communication_devices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
