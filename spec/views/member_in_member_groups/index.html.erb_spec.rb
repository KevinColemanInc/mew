require 'spec_helper'

describe "member_in_member_groups/index" do
  before(:each) do
    assign(:member_in_member_groups, [
      stub_model(MemberInMemberGroup,
        :member_id => "",
        :member_group_id => ""
      ),
      stub_model(MemberInMemberGroup,
        :member_id => "",
        :member_group_id => ""
      )
    ])
  end

  it "renders a list of member_in_member_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
