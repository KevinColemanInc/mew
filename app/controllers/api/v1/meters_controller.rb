class API::V1::MetersController < ApplicationController
  respond_to :json
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  load_and_authorize_resource

  # POST /meters
  # POST /meters.json
  def create
    @meter = Meter.where(bluetooth_mac: params[:meter][:bluetooth_mac]).first
    @meter ||= Meter.new(meter_params)
    
    @errors = @meter.save ? nil : @meter.errors.full_messages.to_sentence

    render :show
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def meter_params
      params.require(:meter).permit(:mid, :bluetooth_mac, :display_name)
    end
end
