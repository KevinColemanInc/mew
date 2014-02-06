json.array! @measurements do |measurement|
  json.id measurement.id
  json.measured_at measurement.measured_at
  json.glucose_value measurement.glucose_value
  json.retrieved_at measurement.retrieved_at
  json.created_at measurement.created_at
  json.code_number measurement.code_number
  json.reading_type measurement.reading_type
  json.archived_at measurement.archived_at

  json.links do
    json.edit link_to 'Edit', edit_member_measurement_path(measurement.member, measurement)
    json.show link_to 'Show', member_measurement_path(measurement.member, measurement)
  end

end
