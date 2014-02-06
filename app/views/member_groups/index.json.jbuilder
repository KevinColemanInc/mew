json.array! @member_groups do |member_group|
  json.id member_group.id
  json.name member_group.name
  json.description member_group.description
  json.number_of_members member_group.grouped_members.length

  json.links do
    json.edit link_to 'Edit', edit_member_group_path(member_group)
    json.destroy link_to 'Destroy', member_group, method: :delete, data: { confirm: 'Are you sure?' }
    json.show link_to 'Show', member_group 
    json.grouped_members link_to 'Manage Members', member_group_grouped_members_path(member_group)
  end

end
