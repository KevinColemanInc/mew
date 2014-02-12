json.status @errors ? 'failed' : 'success'

json.user do
  if @errors
    json.errors @errors
  else
    json.display @user.name
    json.member_id @user.member_number
    json.authentication_token @user.authentication_token
    json.case_managers do
      json.array! @user.managed_members do |managed_member|
        json.name managed_member.case_manager.name
        json.phone_number managed_member.case_manager.phone_number
      end
    end
  end
end
