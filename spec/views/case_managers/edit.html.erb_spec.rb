require 'spec_helper'

describe "case_managers/edit" do
  before(:each) do
    @case_manager = assign(:case_manager, stub_model(CaseManager))
  end

  it "renders the edit case_manager form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", case_manager_path(@case_manager), "post" do
    end
  end
end
