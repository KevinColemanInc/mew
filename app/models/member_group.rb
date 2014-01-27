class MemberGroup < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	
  has_and_belongs_to_many :members, through: :grouped_members

  has_many :grouped_members

end
