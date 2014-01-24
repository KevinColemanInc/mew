require 'role_model'

class CaseManager < User
  include RoleModel
  roles :case_manager_admin, :case_manager

end
