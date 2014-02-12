class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :managed_members

  def name
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

  def generate_authentication_token
    self.authentication_token =  loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
    self.token_expires_at = Time.now + 3.months
  end

end
