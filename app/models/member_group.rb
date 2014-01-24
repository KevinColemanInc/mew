class MemberGroup < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	
  has_and_belongs_to_many :members

end
