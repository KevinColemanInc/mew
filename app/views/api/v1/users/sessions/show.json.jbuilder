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
    if @user.preferred_meter
      json.preferred_meters do 
        json.array! [@user.preferred_meter] do |meter|
          json.id meter.id
          json.mid meter.mid
          json.bluetooth_mac meter.bluetooth_mac
          json.display_name meter.display_name
          json.model meter.model
        end
      end
    end
  end
end

