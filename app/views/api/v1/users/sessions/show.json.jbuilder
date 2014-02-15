json.status @errors ? 'fail' : 'ok'
json.errormsg @errors if @errors

json.user do
  if @errors
    json.errors @errors
  else
    json.display @user.name
    json.member_id @user.member_number
    json.authentication_token @user.authentication_token
    json.case_manager do
      json.name @user.primary_case_manager.name
      json.phone_number @user.primary_case_manager.phone_number
    end
  end
end
