class API::V1::MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:index, :show, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  respond_to :json

  # GET /measurement
  def index
    @measurements = Measurement.mine(@member).where(archived_at: nil)
  end

  # GET /measurements/1
  def show
  end

  # POST /measurements
  def create
    @measurement = Measurement.new(measurement_params)
    @measurement.member = current_user
    
    @errors = @measurement.save ? nil : @measurement.errors.full_messages.to_sentence
    
    render :show
    return
  end

  # PATCH/PUT /measurements/1
  def update
    if params[:measurement][:archive] == "1"
      @measurement.archive
      @measurement.save
    else
      @measurement.unarchive
      @measurement.save
    end

    @measurement.update(measurement_params)
  end

  # DELETE /measurements/1
  def destroy
    @measurement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id]) if params[:id]
      @member = Member.find(params[:member_id])
    end

    # Only allow a trusted parameter "white list" through.
    def measurement_params
      params.require(:measurement).permit(:note, :glucose_value, :measured_at, :code_number, :reading_type, :retrieved_at, :meter_id)
    end

end