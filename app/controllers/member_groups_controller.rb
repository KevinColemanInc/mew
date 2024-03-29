class MemberGroupsController < ApplicationController
  before_action :set_member_group, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  load_and_authorize_resource

  # GET /member_groups
  def index
    @member_groups = MemberGroup.where(created_by: current_user)

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end

  # GET /member_groups/new
  def new
    @member_group = MemberGroup.new
  end

  # GET /member_groups/1/edit
  def edit
  end

  # POST /member_groups
  def create
    @member_group = MemberGroup.new(member_group_params)
    @member_group.created_by = current_user
    if @member_group.save
      redirect_to member_group_grouped_members_path(@member_group)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /member_groups/1
  def update
    if @member_group.update(member_group_params)
      redirect_to @member_group, notice: 'Member group was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /member_groups/1
  def destroy
    @member_group.destroy
    redirect_to member_groups_url, notice: 'Member group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_group
      @member_group = MemberGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_group_params
      params.require(:member_group).permit(:name, :description)
    end
end
