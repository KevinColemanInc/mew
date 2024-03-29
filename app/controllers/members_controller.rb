class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  load_and_authorize_resource
  
  # GET /members
  def index
    if params[:not_in_member_group_id]
      @members = Member.mine(current_user).where(
                   GroupedMember.select(:NULL).where("member_group_id = ? and grouped_members.member_id = users.id", params[:not_in_member_group_id]).exists.not)
    elsif params[:not_managed_by_case_manager_id]
      @members = Member.mine(current_user).where(
                   ManagedMember.select(:NULL).where("case_manager_id = ? and managed_members.member_id = users.id", params[:not_managed_by_case_manager_id]).exists.not)
    else
      @members = Member.includes(:measurements, :managed_members).mine(current_user)
    end

    respond_to do |format|
      format.html
      format.json 
    end
  end

  # GET /members/1
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    @member.password = "password"
    if params[:member][:archive] == "1"
      @member.archive
    else
      @member.unarchive
    end
    if @member.save
      redirect_to @member, notice: 'Member was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /members/1
  def update
   if params[:member][:archive] == "1"
      @member.archive
      @member.save
    else
      @member.unarchive
      @member.save
    end
    if @member.update(member_params)
      redirect_to @member, notice: 'Member was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_params
      params.require(:member).permit(:first_name, :last_name, :email, :phone_number, :member_number, :note)
    end
end
