app.controller('MemberGroupsCtrl', ['$scope', '$resource', function($scope, $resource) {
  var MemberGroups = $resource('/member_groups.json');
  $scope.member_groups = MemberGroups.query();
}]);