class Patients::SessionsController < Devise::SessionsController
  
  def after_sign_in_path_for(resource)
    measurements_path
  end

end