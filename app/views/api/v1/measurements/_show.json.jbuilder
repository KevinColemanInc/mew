json.measurement do
  if measurement.id
    json.id measurement.id
    json.measured_at measurement.measured_at.iso8601
    json.glucose_value measurement.glucose_value
    json.retrieved_at measurement.retrieved_at_in_zone.iso8601
    json.created_at measurement.created_at.iso8601
    json.code_number measurement.code_number
    json.reading_type measurement.reading_type
    json.member_id measurement.member_id
    json.meter_id measurement.meter_id
    json.token measurement.token
    json.note measurement.note
    json.display_name measurement.display_name
    json.payload measurement.payload
  else
    json.errors @errors
  end
end
