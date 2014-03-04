json.status @errors ? 'fail' : 'ok'
json.errormsg @errors if @errors

json.results do
  json.headers @report.headers
  json.results @results
end
