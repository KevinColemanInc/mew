json.array! @meters do |meter|
  json.id meter.id
  json.mid meter.mid
  json.bluetooth_mac meter.bluetooth_mac

  json.links do
    json.edit link_to 'Edit', edit_meter_path(meter)
    json.show link_to 'Show', meter
    json.destroy link_to 'Destroy', meter, method: :delete, data: { confirm: 'Are you sure?' } if current_user.has_role? :case_manager_admin
  end

end
