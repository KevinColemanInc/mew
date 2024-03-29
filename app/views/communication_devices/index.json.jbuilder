json.array! @communication_devices do |communication_device|
  json.id communication_device.id
  json.cdid communication_device.cdid
  json.phone_number communication_device.phone_number
  json.device_type communication_device.device_type
  json.device_model communication_device.device_model
  json.created_at communication_device.created_at
  json.last_communicated_at communication_device.last_communicated_at

  json.links do
    json.show link_to communication_device.cdid, communication_device
  end
end
