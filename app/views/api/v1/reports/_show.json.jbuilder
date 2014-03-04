json.report do
  if report.id
    json.id report.id
    json.display_name report.display_name
  else
    json.errors @errors
  end
end
