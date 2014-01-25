class EmailMessage < ActiveRecord::Base
  validates :body, presence: true
  validates :to, presence: true
  validates :from, presence: true
  validates :member_id, presence: true
  validates :case_manager_id, presence: true

  before_create :send_email

  belongs_to :member
  belongs_to :case_manager

  private
  def send_email
    EmailMessageMailer.case_manager_email(self).deliver
  end

end
