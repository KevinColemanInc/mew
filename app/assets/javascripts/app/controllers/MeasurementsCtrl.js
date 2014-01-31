app.controller('MeasurementsCtrl', ['$scope', '$resource', function($scope, $resource) {
  var Member = $resource('/measurements/data.json');
  
  var GroupedMember = $resource('/member_groups/' + window.member_group_id + '/grouped_members/:id', {format: 'json', id: '@id'})

  $scope.current_members = GroupedMember.query();
  $scope.new_members = Member.query({not_in_member_group_id: window.member_group_id});

}]);