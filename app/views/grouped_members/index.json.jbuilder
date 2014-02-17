json.array! @grouped_members do |group_member|
  json.id group_member.id
  json.member do
  	json.name group_member.member.name
  end
end