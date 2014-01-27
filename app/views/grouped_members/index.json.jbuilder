json.array! @grouped_members do |group_member|
  json.id group_member.id
  json.member do
  	json.first_name group_member.member.first_name
  	json.last_name group_member.member.last_name
  end
end