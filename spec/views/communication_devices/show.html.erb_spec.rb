require 'spec_helper'

describe "communication_devices/show" do
  before(:each) do
    @communication_device = assign(:communication_device, stub_model(CommunicationDevice))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
