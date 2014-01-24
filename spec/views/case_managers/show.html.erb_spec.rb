require 'spec_helper'

describe "case_managers/show" do
  before(:each) do
    @case_manager = assign(:case_manager, stub_model(CaseManager))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
