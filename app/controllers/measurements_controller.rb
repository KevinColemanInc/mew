class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:index, :show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  

  # GET /measurement
  def index
    @measurements = Measurement.mine(@member).where(archived_at: nil)
    respond_to do |format|
      format.json
      format.html
    end
  end

  # GET /measurements/1
  def show
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
    @member = Member.find(params[:member_id])
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements
  def create
    @measurement = Measurement.new(measurement_params)
    @measurement.case_manager = current_user if current_user.is_a? CaseManager
    @measurement.retrieved_at = Time.now unless @measurement.retrieved_at

     if params[:measurement][:archive] == "1"
      @measurement.archive
    else
      @measurement.unarchive
    end

    if @measurement.save
      redirect_to member_measurements_path(@member), notice: 'measurement was successfully created.'
    else
      render action: 'new'
    end
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

    if @measurement.update(measurement_params)
      redirect_to member_measurements_path(@member), notice: 'measurement was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /measurements/1
  def destroy
    @measurement.destroy
    redirect_to measurements_url, notice: 'measurement was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id]) if params[:id]
      @member = Member.find(params[:member_id])
    end

    # Only allow a trusted parameter "white list" through.
    def measurement_params
      params.require(:measurement).permit(:glucose_value, :measured_at, :code_number, :reading_type, :member_id)
    end

end
