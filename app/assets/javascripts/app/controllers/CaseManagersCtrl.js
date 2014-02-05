app.controller('CaseManagersCtrl', ['$scope', '$resource', '$filter', 'ngTableParams', function($scope, $resource, $filter, ngTableParams) {
  var CaseManager = $resource('/case_managers.json');

  $scope.$watch("filter.$", function () {
      $scope.tableParams.reload();
    });

  $scope.case_managers = CaseManager.query(function(response)
    {
      $scope.tableParams = new ngTableParams({
          page: 1,            // show first page
          count: 10,          // count per page
          sorting: {
            full_name: 'asc'     // initial sorting
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