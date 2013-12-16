class GlucoseLevelsController < ApplicationController

  def index
    @glucose_levels = GlucoseLevel.where("serial_number = ?", params[:serial_number]).order(:measured_at)
  end

  def create
    @glucose_level = GlucoseLevel.create!(params.require(:glucose_level).permit( :serial_number, 
                                                                                :glucose_valuesystolic, 
                                                                                :diastolic, 
                                                                                :pulse, 
                                                                                :measured_at,
                                                                                :retrieved_at,
                                                                                :MAP,
                                                                                :measured_at))
    render 
  end

end
