json.table do
  json.headers @results.fields
  json.rows @results
end
