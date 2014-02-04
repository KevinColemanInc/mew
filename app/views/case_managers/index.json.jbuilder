json.array! @case_managers do |case_manager|
  json.id case_manager.id
  json.full_name case_manager.name
  json.email case_manager.email
  json.phone_number case_manager.phone_number
  json.managed_members_length case_manager.managed_members.length

  json.links do
    json.edit link_to 'Edit', edit_case_manager_path(case_manager)
    json.show link_to 'Show', case_manager
    json.managed_members link_to 'Manage Members', case_manager_managed_members_path(case_manager)
  end

end
