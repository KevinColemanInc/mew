json.array! @case_managers_members do |case_managers_member|
  json.id case_managers_member.id
  json.member do
    json.name case_managers_member.member.name
  end
end