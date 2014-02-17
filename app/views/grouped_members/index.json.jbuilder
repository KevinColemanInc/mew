json.array! @grouped_members do |group_member|
  json.id group_member.id
  json.member do
  	json.display_name group_member.member.display_name
  end
end