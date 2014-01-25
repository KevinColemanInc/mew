require 'spec_helper'

describe "email_messages/edit" do
  before(:each) do
    @email_message = assign(:email_message, stub_model(EmailMessage,
      :to => "",
      :from => "",
      :body => "",
      :member_id => "",
      :case_manager_id => ""
    ))
  end

  it "renders the edit email_message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", email_message_path(@email_message), "post" do
      assert_select "input#email_message_to[name=?]", "email_message[to]"
      assert_select "input#email_message_from[name=?]", "email_message[from]"
      assert_select "input#email_message_body[name=?]", "email_message[body]"
      assert_select "input#email_message_member_id[name=?]", "email_message[member_id]"
      assert_select "input#email_message_case_manager_id[name=?]", "email_message[case_manager_id]"
    end
  end
end
