json.array! @meters do |meter|
  json.id meter.id
  json.mid meter.mid
  json.bluetooth_mac meter.bluetooth_mac

  json.links do
    json.show link_to meter.mid, meter
  end

end
