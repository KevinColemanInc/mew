class CaseManagers::RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Case managers can not register'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Case managers can not register'
    redirect_to root_path
  end
end
