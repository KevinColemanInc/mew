app.controller('MembersInMemberGroupsCtrl', ['$scope', '$resource', function($scope, $resource) {
  var Member = $resource('/members.json');
  
  var MemberInMemberGroup = $resource('/member_groups/' + window.member_group_id + '/member_in_member_groups/:id', {format: 'json', id: '@id'})

  $scope.current_members = MemberInMemberGroup.query();
  $scope.new_members = Member.query({not_in_member_group_id: window.member_group_id});


  $scope.addMember = function(member) {
  	var newMemberinMemberGroup = new MemberInMemberGroup({member_in_member_group: {member_id: member.id, member_group_id: window.member_group_id}});
  	newMemberinMemberGroup.$save(function (response) {     
		   $scope.current_members = MemberInMemberGroup.query();
  			$scope.new_members = Member.query({not_in_member_group_id: window.member_group_id});                       
		});

  };

  $scope.removeMemberInMembersGroup = function(memberInMembersGroup) {
  	var newMemberinMemberGroup = new MemberInMemberGroup({id: memberInMembersGroup.id});
  	
  	newMemberinMemberGroup.$delete(function (response) {     
		   $scope.current_members = MemberInMemberGroup.query();
  		   $scope.new_members = Member.query({not_in_member_group_id: window.member_group_id});                       
		});
	
  };

}]);