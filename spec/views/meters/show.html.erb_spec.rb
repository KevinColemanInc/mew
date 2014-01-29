require 'spec_helper'

describe "meters/show" do
  before(:each) do
    @meter = assign(:meter, stub_model(Meter))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
