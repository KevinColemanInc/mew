require 'spec_helper'

describe "communication_devices/new" do
  before(:each) do
    assign(:communication_device, stub_model(CommunicationDevice).as_new_record)
  end

  it "renders new communication_device form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", communication_devices_path, "post" do
    end
  end
end
