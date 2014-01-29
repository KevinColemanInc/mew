require 'spec_helper'

describe "meters/index" do
  before(:each) do
    assign(:meters, [
      stub_model(Meter),
      stub_model(Meter)
    ])
  end

  it "renders a list of meters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
