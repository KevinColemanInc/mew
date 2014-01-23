class MeasurementsController < ApplicationController
  protect_from_forgery :except => [:create]

  def index
    @glucose_levels = GlucoseLevel.where("serial_number = ?", params[:serial_number]).order(:measured_at) if params[:serial_number]
  end

  def create
    puts 'params'
    puts params.inspect
    @glucose_level = GlucoseLevel.create!(params.permit(:serial_number, 
                                                                                :glucose_value,
                                                                                :reading_type,
                                                                                :retrieved_at,
                                                                                :code_number,
                                                                                :measured_at))
     respond_to do |format|
      format.json { render :json => @glucose_level }
    end
  end

end