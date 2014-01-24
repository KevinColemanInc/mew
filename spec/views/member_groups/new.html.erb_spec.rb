require 'spec_helper'

describe "member_groups/new" do
  before(:each) do
    assign(:member_group, stub_model(MemberGroup).as_new_record)
  end

  it "renders new member_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", member_groups_path, "post" do
    end
  end
end
