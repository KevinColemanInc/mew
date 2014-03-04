class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
  	cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false }
      format.json { render json: { status: "fail", errormsg: exception.message } }
    end
  end

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  protected
  def authenticate_user_from_token!
    if params[:user]
      user_email = params[:user][:email]
      user    = User.where(email: user_email).first if params[:user][:email]

      if user && Devise.secure_compare(user.access_token, params[:user][:access_token]) && user.token_expires_at > Time.now
        sign_in :user, user
      end
    end
  end

  protected
  def verified_request?
  	super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end 

end
