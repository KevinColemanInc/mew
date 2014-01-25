class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  
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
end
