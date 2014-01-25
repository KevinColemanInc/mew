require 'spec_helper'

describe "email_messages/show" do
  before(:each) do
    @email_message = assign(:email_message, stub_model(EmailMessage,
      :to => "",
      :from => "",
      :body => "",
      :member_id => "",
      :case_manager_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
