class API::V1::MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:index, :show, :update]

  skip_before_filter :verify_authenticity_token

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  load_and_authorize_resource

  respond_to :json

  # GET /measurement
  def index
    @measurements = Measurement.mine(current_user).where(archived_at: nil)
  end

  # GET /measurements/1
  def show
    
  end

   # PATCH/PUT /measurements/1
  def update
    @errors = @measurement.update(measurement_params) ? nil : @measurement.errors.full_messages.to_sentence
    render :show
  end

  # POST /measurements
  def create
    @measurement = Measurement.new(measurement_params)
    @measurement.member = current_user
    @measurement.retrieved_at_time_zone = (DateTime.iso8601 params[:measurement][:retrieved_at]).utc_offset
    @measurement.measured_at_time_zone = (DateTime.iso8601 params[:measurement][:measured_at]).utc_offset

    existing = Measurement.where(token: @measurement.generate_token).first

    @measurement = existing if existing

    @errors = @measurement.save ? nil : @measurement.errors.full_messages.to_sentence
    
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id]) if params[:id]
      @member = current_user
    end

    # Only allow a trusted parameter "white list" through.
    def measurement_params
      params.require(:measurement).permit(:note, 
                                          :glucose_value, 
                                          :measured_at, 
                                          :code_number, 
                                          :reading_type, 
                                          :retrieved_at, 
                                          :meter_id, 
                                          :communication_device_id,
                                          :payload,
                                          :measured_at_time_zone)
    end

end
