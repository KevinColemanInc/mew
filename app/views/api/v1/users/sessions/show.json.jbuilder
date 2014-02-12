json.status @errors ? 'failed' : 'success'

json.user do
  if @errors
    json.errors @errors
  else
    json.email @user.email
    json.authentication_token @user.authentication_token
    json.token_expires_at @user.token_expires_at
    json.case_managers do
      json.array! @users.case_managers do |case_manager|

      end
    end
  end
end
