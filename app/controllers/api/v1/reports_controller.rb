class API::V1::ReportsController < ApplicationController
  respond_to :json
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  load_and_authorize_resource

  def index
    @meter = Report.all
    render :index
  end

  def run
    @meter = Meter.where(bluetooth_mac: params[:meter][:bluetooth_mac]).first
    @meter ||= Meter.new(meter_params)
    
    @errors = @meter.save ? nil : @meter.errors.full_messages.to_sentence

    render :run
  end

end
