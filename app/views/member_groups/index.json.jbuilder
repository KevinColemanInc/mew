json.array! @member_groups do |member_group|
  json.id member_group.id
  json.display_name member_group.display_name
  json.description member_group.description
  json.number_of_members member_group.grouped_members.length

  json.links do
    json.show link_to member_group.display_name, member_group 
    json.grouped_members link_to 'Manage Members', member_group_grouped_members_path(member_group)
  end

end
