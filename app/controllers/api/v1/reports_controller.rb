class API::V1::ReportsController < ApplicationController
  respond_to :json
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  before_action :set_report, only: [:show]

  load_and_authorize_resource

  def index
    @meter = Report.all
    render :index
  end

  def run
    @results = ActiveRecord::Base.connection.execute(@report.sql)
    render :run
  end


  private
  # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end
end
