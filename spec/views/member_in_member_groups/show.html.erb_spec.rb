require 'spec_helper'

describe "member_in_member_groups/show" do
  before(:each) do
    @member_in_member_group = assign(:member_in_member_group, stub_model(MemberInMemberGroup,
      :member_id => "",
      :member_group_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
