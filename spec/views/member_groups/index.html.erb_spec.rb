require 'spec_helper'

describe "member_groups/index" do
  before(:each) do
    assign(:member_groups, [
      stub_model(MemberGroup),
      stub_model(MemberGroup)
    ])
  end

  it "renders a list of member_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
