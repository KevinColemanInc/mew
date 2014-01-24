require 'spec_helper'

describe "case_managers/index" do
  before(:each) do
    assign(:case_managers, [
      stub_model(CaseManager),
      stub_model(CaseManager)
    ])
  end

  it "renders a list of case_managers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
