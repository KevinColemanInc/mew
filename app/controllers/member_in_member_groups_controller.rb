class MemberInMemberGroupsController < ApplicationController
  before_action :set_member_in_member_group, only: [:update, :destroy]
  before_filter :authenticate_user!
  

  def index
    @member_group = MemberGroup.find(params[:member_group_id])
    @member_in_member_groups = MemberInMemberGroup.all
  end

  def create
    @member_in_member_group = MemberInMemberGroup.new(member_in_member_group_params)

    if @member_in_member_group.save
      respond_to do |format|
        format.json { render :json => @member_in_member_group }
      end
    else
      render action: 'new'
    end
  end

  def destroy
    @member_in_member_group.destroy

    respond_to do |format|
      format.json { render :json => @member_in_member_group }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_in_member_group
      @member_in_member_group = MemberInMemberGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_in_member_group_params
      params.require(:member_in_member_group).permit(:member_id, :member_group_id)
    end
end
