class ManagedMembersController < ApplicationController
  before_action :set_managed_member, only: [:destroy]
  before_filter :authenticate_user!
  

  def index
    @case_manager = CaseManager.find(params[:case_manager_id])
    @case_managers_members = @case_manager.managed_members
  end

  def create
    @managed_member = ManagedMember.new(managed_member_params)

    if @managed_member.save
      respond_to do |format|
        format.json { render :json => @managed_member }
      end
    else
      puts @managed_member.errors.inspect
      render action: 'new'
    end
  end

  def destroy
    @managed_member.destroy

    respond_to do |format|
      format.json { render :json => @managed_member }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_managed_member
      @managed_member = ManagedMember.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def managed_member_params
      params.require(:managed_member).permit(:member_id, :case_manager_id)
    end
end
