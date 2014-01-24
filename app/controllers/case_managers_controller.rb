class CaseManagersController < ApplicationController
  before_action :set_case_manager, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /case_managers
  def index
    @case_managers = CaseManager.all
  end

  # GET /case_managers/1
  def show
  end

  # GET /case_managers/new
  def new
    @case_manager = CaseManager.new
  end

  # GET /case_managers/1/edit
  def edit
  end

  # POST /case_managers
  def create
    @case_manager = CaseManager.new(case_manager_params)

    if @case_manager.save
      redirect_to @case_manager, notice: 'Case manager was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /case_managers/1
  def update
    if @case_manager.update(case_manager_params)
      redirect_to @case_manager, notice: 'Case manager was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /case_managers/1
  def destroy
    @case_manager.destroy
    redirect_to case_managers_url, notice: 'Case manager was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_manager
      @case_manager = CaseManager.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def case_manager_params
      params.require(:case_manager).permit(:email, :first_name, :last_name)
    end
end
