json.status @errors ? 'fail' : 'ok'
json.errormsg @errors if @errors

json.partial! 'api/v1/measurements/show', measurement: @measurement
