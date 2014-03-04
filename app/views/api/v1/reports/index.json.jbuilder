json.status @errors ? 'fail' : 'ok'
json.errormsg @errors if @errors

json.reports do
  json.array! @reports do |report|
    json.partial! 'api/v1/reports/show', report: report
  end
end
