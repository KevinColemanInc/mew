class Meter < ActiveRecord::Base
	validates :mid, presence: true
	validates :bluetooth_mac, presence: true, format: { with: /\A[[a-zA-Z0-9]{2}:]{17}\z/ } 
  validates :model, presence: true
  validates :display_name, presence: true
  validate :limit_meter_models
  
	has_many :measurements
  
  private
  def limit_meter_models
    if model != "blood_glucose"
      errors.add(:model, "must be blood_glucose")
    end
  end

end
