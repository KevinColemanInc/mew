class GroupedMembersController < ApplicationController
  before_action :set_grouped_member, only: [:update, :destroy]
  before_filter :authenticate_user!
  
  load_and_authorize_resource

  def index
    @member_group = MemberGroup.find(params[:member_group_id])
    @grouped_members = @member_group.grouped_members
  end

  def create
    @grouped_member = GroupedMember.new(group_member_params)

    if @grouped_member.save
      respond_to do |format|
        format.json { render :json => @grouped_member }
      end

    else
      render action: 'new'
    end
  end

  def destroy
    @grouped_member.destroy

    respond_to do |format|
      format.json { render :json => @grouped_member }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grouped_member
      @grouped_member = GroupedMember.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_member_params
      params.require(:grouped_member).permit(:member_id, :member_group_id)
    end
end
