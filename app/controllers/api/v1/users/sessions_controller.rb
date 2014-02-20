class API::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  protect_from_forgery :except => :create 
  
  def create
    if params.has_key?(:user)
      if !params[:user].has_key?(:email) or !params[:user].has_key?(:password)
        @errors = "The request must contain the user email and password."
        render :show and return
      end
    else
      @errors = "The request must contain the user email and password."
      render :show and return
    end

    @user = User.where(email: params[:user][:email].downcase).first

    if @user.nil?
      @errors = "invalid email or password."
      render :show and return
    end

    if not @user.valid_password?(params[:user][:password])
      @errors = "invalid email or password."
      render :show and return
    elsif @user.is_a? CaseManager
      @errors = "api is for members only"
      render :show and return
    else 
      @user.generate_authentication_token
      @user.save
      render :show and return
    end
    render :show and return
  end

end