class MetersController < ApplicationController
  before_action :set_meter, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /meters
  # GET /meters.json
  def index
    if params[:member_id]
      @meters = Meter.joins("join meters_users on meters_users.meter_id = meters.id").where("meters_users.member_id = ?", params[:member_id])
    else
      @meters = Meter.all
    end
    
    respond_to do |format|
      format.html
    end
  end

  # GET /meters/1
  # GET /meters/1.json
  def show
  end

  # GET /meters/new
  def new
    @meter = Meter.new
  end

  # GET /meters/1/edit
  def edit
  end

  # POST /meters
  # POST /meters.json
  def create
    @meter = Meter.new(meter_params)

    respond_to do |format|
      if @meter.save
        format.html { redirect_to @meter, notice: 'Meter was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /meters/1
  # PATCH/PUT /meters/1.json
  def update
    respond_to do |format|
      if @meter.update(meter_params)
        format.html { redirect_to @meter, notice: 'Meter was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /meters/1
  # DELETE /meters/1.json
  def destroy
    @meter.destroy
    respond_to do |format|
      format.html { redirect_to meters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meter
      @meter = Meter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meter_params
      params.require(:meter).permit(:mid, :bluetooth_mac, :display_name)
    end
end
