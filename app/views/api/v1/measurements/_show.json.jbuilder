json.measurement do
  if measurement.id
    json.id measurement.id
    json.measured_at measurement.measured_at
    json.glucose_value measurement.glucose_value
    json.retrieved_at measurement.retrieved_at
    json.created_at measurement.created_at
    json.code_number measurement.code_number
    json.reading_type measurement.reading_type
    json.member_id measurement.member_id
    json.token measurement.token
    json.note measurement.note
    json.display_name measurement.display_name
  else
    json.errors @errors
  end
end
