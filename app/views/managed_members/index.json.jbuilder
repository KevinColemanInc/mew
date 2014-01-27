json.array! @case_managers_members do |case_managers_member|
  json.id case_managers_member.id
  json.member do
    json.first_name case_managers_member.member.first_name
    json.last_name case_managers_member.member.last_name
  end
end