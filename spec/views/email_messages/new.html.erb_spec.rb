require 'spec_helper'

describe "email_messages/new" do
  before(:each) do
    assign(:email_message, stub_model(EmailMessage,
      :to => "",
      :from => "",
      :body => "",
      :member_id => "",
      :case_manager_id => ""
    ).as_new_record)
  end

  it "renders new email_message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", email_messages_path, "post" do
      assert_select "input#email_message_to[name=?]", "email_message[to]"
      assert_select "input#email_message_from[name=?]", "email_message[from]"
      assert_select "input#email_message_body[name=?]", "email_message[body]"
      assert_select "input#email_message_member_id[name=?]", "email_message[member_id]"
      assert_select "input#email_message_case_manager_id[name=?]", "email_message[case_manager_id]"
    end
  end
end
