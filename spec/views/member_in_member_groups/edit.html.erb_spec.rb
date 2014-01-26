require 'spec_helper'

describe "member_in_member_groups/edit" do
  before(:each) do
    @member_in_member_group = assign(:member_in_member_group, stub_model(MemberInMemberGroup,
      :member_id => "",
      :member_group_id => ""
    ))
  end

  it "renders the edit member_in_member_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", member_in_member_group_path(@member_in_member_group), "post" do
      assert_select "input#member_in_member_group_member_id[name=?]", "member_in_member_group[member_id]"
      assert_select "input#member_in_member_group_member_group_id[name=?]", "member_in_member_group[member_group_id]"
    end
  end
end
