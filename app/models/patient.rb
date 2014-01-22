class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :meters
  has_and_belongs_to_many :communication_devices
  has_and_belongs_to_many :patient_groups
  
end
