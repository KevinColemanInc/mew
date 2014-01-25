class EmailMessageMailer < ActionMailer::Base
  default from: "noreply@example.com"

  def case_manager_email(message)
    @message = message
    mail(to: @message.to, from: @message.from, subject: 'Notification from your Case Manager')
  end

end
