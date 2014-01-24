require 'spec_helper'

describe "member_groups/edit" do
  before(:each) do
    @member_group = assign(:member_group, stub_model(MemberGroup))
  end

  it "renders the edit member_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", member_group_path(@member_group), "post" do
    end
  end
end
