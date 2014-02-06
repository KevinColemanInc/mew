app.controller('ManagedMembersCtrl', ['$scope', '$resource', function($scope, $resource) {
  var Member = $resource('/members.json');
  
  var ManagedMember = $resource('/case_managers/' + window.case_manager_id + '/managed_members/:id', {format: 'json', id: '@id'})

  $scope.current_members = ManagedMember.query();
  $scope.new_members = Member.query({not_managed_by_case_manager_id: window.case_manager_id});


  $scope.addMember = function(member) {
    var newManagedMember = new ManagedMember({managed_member: {member_id: member.id, case_manager_id: window.case_manager_id}});
    newManagedMember.$save(function (response) {     
       $scope.current_members = ManagedMember.query();
        $scope.new_members = Member.query({not_managed_by_case_manager_id: window.case_manager_id});                       
    });

  };

  $scope.removeManagedMember = function(managedMember) {
    var newManagedMember = new ManagedMember({id: managedMember.id});
    
    newManagedMember.$delete(function (response) {     
       $scope.current_members = ManagedMember.query();
         $scope.new_members = Member.query({not_managed_by_case_manager_id: window.case_manager_id});                       
    });
  
  };

}]);
