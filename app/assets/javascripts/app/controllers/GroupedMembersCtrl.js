app.controller('GroupedMembersCtrl', ['$scope', '$resource', function($scope, $resource) {
  var Member = $resource('/members.json');
  
  var GroupedMember = $resource('/member_groups/' + window.member_group_id + '/grouped_members/:id', {format: 'json', id: '@id'})

  $scope.current_members = GroupedMember.query();
  $scope.new_members = Member.query({not_in_member_group_id: window.member_group_id});


  $scope.addMember = function(member) {
  	var newGroupedMember = new GroupedMember({grouped_member: {member_id: member.id, member_group_id: window.member_group_id}});
  	newGroupedMember.$save(function (response) {     
		   $scope.current_members = GroupedMember.query();
  			$scope.new_members = Member.query({not_in_member_group_id: window.member_group_id});                       
		});

  };

  $scope.removeGroupedMember = function(groupedMember) {
  	var newGroupedMember = new GroupedMember({id: groupedMember.id});
  	
  	newGroupedMember.$delete(function (response) {     
		   $scope.current_members = GroupedMember.query();
  		   $scope.new_members = Member.query({not_in_member_group_id: window.member_group_id});                       
		});
	
  };

}]);
