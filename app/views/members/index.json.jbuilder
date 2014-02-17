json.array! @members do |member|
  json.id member.id
  json.display_name member.display_name
  json.member_number member.member_number
  json.email member.email
  json.measurement_count_last_28_days member.measurement_count_last_days(28)

  json.managed_members_length member.managed_members.length

  json.links do
    json.show link_to member.display_name, member
    json.measurement_count link_to "#{member.measurements.length}", member_measurements_path(member)
  end

end
