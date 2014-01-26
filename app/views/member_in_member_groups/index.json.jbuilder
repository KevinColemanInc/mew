json.array! @member_in_member_groups do |member_in_member_group|
  json.id member_in_member_group.id
  json.member do
  	json.first_name member_in_member_group.member.first_name
  	json.last_name member_in_member_group.member.last_name
  end
end