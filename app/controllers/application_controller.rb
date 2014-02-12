class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
  	cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  protected
  def authenticate_user_from_token!
    user_email = params[:user_email].presence
    user       = User.where(email: user_email).first

    if user && Devise.secure_compare(user.authentication_token, params[:user_token]) && user.token_expires_at > Time.now
      sign_in :user, user
      puts 'auth worked!'
    end
  end

  protected
  def verified_request?
  	super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end 

end
