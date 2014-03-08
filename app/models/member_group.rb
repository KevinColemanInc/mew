class MemberGroup < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true

  belongs_to :created_by, class_name: "CaseManager"
	
	has_many :grouped_members


  def self.mine(case_manager)
      where("created_by = ?", case_manager.id)
  end

end
