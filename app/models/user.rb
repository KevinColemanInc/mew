class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  before_create :upper_case_names

  has_many :managed_members

  def display_name
    "#{last_name}, #{first_name}"
  end
  
  def archive
    self.archived_at = Time.current
  end

  def unarchive
    self.archived_at = nil
  end

  def archived?
    !archived_at.nil?
  end

  def active_for_authentication?
    !archived?
  end

  def generate_access_token
    self.access_token =  loop do
      token = Devise.friendly_token
      break token unless User.where(access_token: token).first
    end
    self.token_expires_at = Time.now + 3.months
  end

  private
  def upper_case_names
    first_name.capitalize!
    last_name.capitalize!
  end

end
