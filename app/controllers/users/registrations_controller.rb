class Users::RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Users can not register'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Users can not register'
    redirect_to root_path
  end

  def destroy
    flash[:info] = 'Users can not delete their account'
    redirect_to root_path
  end
end
