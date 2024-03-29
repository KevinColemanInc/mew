json.array! @email_messages do |email_message|
  json.id email_message.id
  json.from email_message.from
  json.body email_message.body
  json.member_name email_message.member.display_name
  json.case_manager_name email_message.case_manager.display_name
  json.created_at email_message.created_at

  json.links do
    json.show link_to datetime_to_string(email_messat.created_at), member_email_message_path(email_message.member, email_message)
  end

end
