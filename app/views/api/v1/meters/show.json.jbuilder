json.status @errors ? 'fail' : 'ok'
json.errormsg @errors if @errors

json.meter do
  if @errors
    json.errors @errors
  else
    json.id @meter.id
    json.mid @meter.mid
    json.bluetooth_mac @meter.bluetooth_mac
    json.display_name @meter.display_name
  end
end
