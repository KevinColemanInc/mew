class CommunicationDevice < ActiveRecord::Base
	validates :cdid, presence: true
	
	has_many :measurements

  def display_name
    cdid
  end

end
