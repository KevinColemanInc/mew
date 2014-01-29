require 'spec_helper'

describe "communication_devices/edit" do
  before(:each) do
    @communication_device = assign(:communication_device, stub_model(CommunicationDevice))
  end

  it "renders the edit communication_device form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", communication_device_path(@communication_device), "post" do
    end
  end
end
