json.status @errors ? 'failure' : 'successful'

json.measurement do
  if @measurement.id
    json.id @measurement.id
    json.measured_at @measurement.measured_at.to_i
    json.glucose_value @measurement.glucose_value
    json.retrieved_at @measurement.retrieved_at
    json.created_at @measurement.created_at
    json.code_number @measurement.code_number
    json.reading_type @measurement.reading_type
  else
    json.errors @errors
  end
end
