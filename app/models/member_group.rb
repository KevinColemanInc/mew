class MemberGroup < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	
  has_and_belongs_to_many :members

  has_many :member_in_member_groups

end
