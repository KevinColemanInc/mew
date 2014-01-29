class CommunicationDevicesController < ApplicationController
  before_action :set_communication_device, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  # GET /communication_devices
  # GET /communication_devices.json
  def index
    if params[:not_for_meter_id]
      @communication_devices = CommunicationDevice.where("NOT EXISTS (SELECT NULL FROM communication_devices_meters where communication_devices_meters.communication_device_id = communication_devices.id and communication_devices_meters.meter_id = ?)", params[:not_for_meter_id])   
    elsif params[:for_meter_id]
      @communication_devices = CommunicationDevice.joins(:meters).where('meters.id = ?', params[:for_meter_id])
    else
      @communication_devices = CommunicationDevice.all
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @communication_devices }
    end
  end

  # GET /communication_devices/1
  # GET /communication_devices/1.json
  def show
  end

  # GET /communication_devices/new
  def new
    @communication_device = CommunicationDevice.new
  end

  # GET /communication_devices/1/edit
  def edit
  end

  # POST /communication_devices
  # POST /communication_devices.json
  def create
    @communication_device = CommunicationDevice.new(communication_device_params)

    respond_to do |format|
      if @communication_device.save
        format.html { redirect_to @communication_device, notice: 'Communication device was successfully created.' }
        format.json { render action: 'show', status: :created, location: @communication_device }
      else
        format.html { render action: 'new' }
        format.json { render json: @communication_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communication_devices/1
  # PATCH/PUT /communication_devices/1.json
  def update
    if params[:add_meter_id]
      @communication_device.meters << Meter.find(params[:add_meter_id])
      @communication_device.save
    elsif params[:remove_meter_id]
      @communication_device.meters.delete Meter.find(params[:remove_meter_id])
      @communication_device.save
    end
    respond_to do |format|
      if @communication_device.update(communication_device_params)
        format.html { redirect_to @communication_device, notice: 'Communication device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @communication_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communication_devices/1
  # DELETE /communication_devices/1.json
  def destroy
    @communication_device.destroy
    respond_to do |format|
      format.html { redirect_to communication_devices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_communication_device
      @communication_device = CommunicationDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def communication_device_params
      params[:communication_device]
    end
end
