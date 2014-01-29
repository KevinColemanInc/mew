require 'spec_helper'

describe "meters/new" do
  before(:each) do
    assign(:meter, stub_model(Meter).as_new_record)
  end

  it "renders new meter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", meters_path, "post" do
    end
  end
end
