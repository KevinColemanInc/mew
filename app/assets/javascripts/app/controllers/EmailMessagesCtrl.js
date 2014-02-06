app.controller('EmailMessagesCtrl', ['$scope', '$resource', '$filter', 'ngTableParams', function($scope, $resource, $filter, ngTableParams) {
  var EmailMessage = $resource('/members/' + window.member_id + '/email_messages.json');

  $scope.$watch("filter.$", function () {
      $scope.tableParams.reload();
    });

  $scope.case_managers = EmailMessage.query(function(response)
    {
      $scope.tableParams = new ngTableParams({
          page: 1,            // show first page
          count: 10,          // count per page
          sorting: {
            created_at: 'desc'     // initial sorting
          }
      }, {
          total: $scope.case_managers.length, // length of data
          getData: function($defer, params) {

            var filteredData = $filter('filter')($scope.case_managers, $scope.filter);

            var orderedData = params.sorting() ?
                                $filter('orderBy')(filteredData, params.orderBy()) :
                                filteredData;
            params.total(orderedData.length); // set total for recalc pagination

            $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
          }, $scope: $scope
      });
    });
}]);
