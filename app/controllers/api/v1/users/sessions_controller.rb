class API::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json
  
  def create
    if params[:user][:email].nil? or params[:user][:password].nil?
      @errors = "The request must contain the user email and password."
      return
    end

    @user = User.where(email: params[:user][:email].downcase).first

    if @user.nil?
      @errors = "invalid email or password."
      render :show
      return
    end

    if not @user.valid_password?(params[:user][:password])
      @errors = "invalid email or password."
      render :show
      return
    elsif @user.is_a? CaseManager
      @errors = "api is for members only"
      render :show
      return
    else 
      @user.generate_authentication_token
      @user.save
      render :show
      return
    end

    render :show
    return
  end

end