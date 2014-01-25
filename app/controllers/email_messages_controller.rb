class EmailMessagesController < ApplicationController
  before_action :set_email_message, only: [:show]

  # GET /email_messages
  def index
    @email_messages = EmailMessage.where(member_id: params[:id])
  end

  # GET /email_messages/1
  def show

  end

  # GET /email_messages/new
  def new
    @email_message = EmailMessage.new
    @email_message.to = Member.find(params[:id]).email
    @email_message.from = current_user.email
  end

  # POST /email_messages
  def create
    @email_message = EmailMessage.new(email_message_params)
    @email_message.member = Member.find(params[:id])
    @email_message.to = @email_message.member.email
    @email_message.from = current_user.email
    @email_message.case_manager = current_user

    if @email_message.save
      redirect_to email_message_path(@email_message.member, @email_message), notice: 'Email message was successfully created.'
    else
      render action: 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_message
      @email_message = EmailMessage.find(params[:email_message_id])
    end

    # Only allow a trusted parameter "white list" through.
    def email_message_params
      params.require(:email_message).permit(:to, :from, :body)
    end
end
