json.array! @reports do |report|
  json.partial! 'api/v1/reports/show', report: report
end