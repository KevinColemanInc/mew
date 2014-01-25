require 'spec_helper'

describe "email_messages/index" do
  before(:each) do
    assign(:email_messages, [
      stub_model(EmailMessage,
        :to => "",
        :from => "",
        :body => "",
        :member_id => "",
        :case_manager_id => ""
      ),
      stub_model(EmailMessage,
        :to => "",
        :from => "",
        :body => "",
        :member_id => "",
        :case_manager_id => ""
      )
    ])
  end

  it "renders a list of email_messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
