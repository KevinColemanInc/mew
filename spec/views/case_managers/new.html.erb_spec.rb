require 'spec_helper'

describe "case_managers/new" do
  before(:each) do
    assign(:case_manager, stub_model(CaseManager).as_new_record)
  end

  it "renders new case_manager form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", case_managers_path, "post" do
    end
  end
end
