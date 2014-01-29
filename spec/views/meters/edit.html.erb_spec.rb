require 'spec_helper'

describe "meters/edit" do
  before(:each) do
    @meter = assign(:meter, stub_model(Meter))
  end

  it "renders the edit meter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", meter_path(@meter), "post" do
    end
  end
end
