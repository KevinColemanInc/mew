require 'role_model'

class CaseManager < User
  include RoleModel
  include Archivable
  
  roles :case_manager_admin, :case_manager

  #has_many :managed_members
  #has_many :member_groups

end
