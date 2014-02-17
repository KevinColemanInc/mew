json.array! @case_managers_members do |case_managers_member|
  json.id case_managers_member.id
  json.member do
    json.display_name case_managers_member.member.display_name
  end
end