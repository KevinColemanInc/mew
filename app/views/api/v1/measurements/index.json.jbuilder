json.status @errors ? 'fail' : 'ok'
json.errormsg @errors if @errors

json.measurements do
  json.array! @measurements do |measurement|
    json.partial! 'api/v1/measurements/show', measurement: measurement
  end
end