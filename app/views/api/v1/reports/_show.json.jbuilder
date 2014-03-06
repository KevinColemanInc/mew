if report.id
  json.id report.id
  json.name report.name

  json.links do
    json.show link_to report.name, report_path(report)
  end

else
  json.errors @errors
end