json.status @errors ? 'fail' : 'ok'
json.errormsg @errors if @errors

json.user do
  if @errors
    json.errors @errors
  else
    json.id @user.id
    json.display_name @user.display_name
    json.member_id @user.member_number
    json.authentication_token @user.authentication_token
    json.case_manager do
      json.id @user.primary_case_manager.id
      json.display_name @user.primary_case_manager.display_name
      json.phone_number @user.primary_case_manager.phone_number
    end
    if @user.meter
      json.preferred_meter do 
        json.id @user.meter.id
        json.mid @user.meter.mid
        json.bluetooth_mac @user.meter.bluetooth_mac
        json.display_name @user.meter.display_name
      end
    end
  end
end

