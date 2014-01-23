class Patients::RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Patients can not register'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Patients can not register'
    redirect_to root_path
  end
end
