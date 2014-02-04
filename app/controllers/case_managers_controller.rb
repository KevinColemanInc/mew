require 'securerandom'

class CaseManagersController < ApplicationController
  before_action :set_case_manager, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  

  # GET /case_managers
  def index
    if current_user.is_a? CaseManager
      @case_managers = CaseManager.all
    elsif current_user.is_a? Member
      @case_managers = current_user.case_managers
    end

    respond_to do |format|
      format.json
      format.html
    end
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
    @case_manager.password = SecureRandom.hex
    if params[:case_manager][:archive] == "1"
      @case_manager.archive
    else
      @case_manager.unarchive
    end

    if !(@case_manager.has_role? :case_manager_admin) && params[:case_manager][:is_an_admin] == "1"
      @case_manager.roles << :case_manager_admin
    elsif (@case_manager.has_role? :case_manager_admin) && params[:case_manager][:is_an_admin] == "0"
      @case_manager.roles.delete(:case_manager_admin)
    end

    if @case_manager.save
      redirect_to @case_manager, notice: 'Case manager was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /case_managers/1
  def update
    if @case_manager.update(case_manager_params)
      if params[:case_manager][:archive] == "1"
        @case_manager.archive
        @case_manager.save
      else
        @case_manager.unarchive
        @case_manager.save
      end

      if !(@case_manager.has_role? :case_manager_admin) && params[:case_manager][:is_an_admin] == "1"
        @case_manager.roles << :case_manager_admin
      elsif (@case_manager.has_role? :case_manager_admin) && params[:case_manager][:is_an_admin] == "0"
        @case_manager.roles.delete(:case_manager_admin)
      end

      @case_manager.save

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
      params.require(:case_manager).permit(:email, :first_name, :last_name, :phone_number)
    end
end
