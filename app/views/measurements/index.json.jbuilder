json.array! @measurements do |measurement|
  json.id measurement.id
  json.measured_at measurement.measured_at.iso8601
  json.glucose_value measurement.glucose_value
  json.retrieved_at measurement.retrieved_at
  json.created_at measurement.created_at
  json.code_number measurement.code_number
  json.reading_type measurement.reading_type
  json.archived_at measurement.archived_at

  json.links do
    json.show link_to datetime_to_string(measurement.measured_at), member_measurement_path(measurement.member, measurement)
  end

end
