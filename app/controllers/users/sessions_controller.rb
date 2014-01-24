class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    if resource.is_a? CaseManager
      members_path
    elsif resource.is_a? Member
      measurements_path
    end
  end
  
  def RegistrationsController

  end
end