class ReportsController < ApplicationController
  before_action :set_report, only: [:show]
  before_filter :authenticate_user!
  
  load_and_authorize_resource

  def index
    
  end

  def show
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end
end
