app.controller('ReportsTableCtrl', ['$scope', '$resource', '$filter', 'ngTableParams', function($scope, $resource, $filter, ngTableParams) {
  var Report = $resource('/api/v1/reports.json');

  $scope.reports = Report.query(function(response)
    {
      $scope.tableParams = new ngTableParams({
          page: 1,            // show first page
          count: 10,          // count per page
          sorting: {
            display_name: 'asc'     // initial sorting
          }
      }, {
          total: $scope.reports.length, // length of data
          getData: function($defer, params) {

            var filteredData = $filter('filter')($scope.reports, $scope.filter);

            var orderedData = params.sorting() ?
                                $filter('orderBy')(filteredData, params.orderBy()) :
                                filteredData;
            params.total(orderedData.length); // set total for recalc pagination

            $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
          }, $scope: $scope
      });

      $scope.$watch("filter.$", function () {
        $scope.tableParams.reload();
      });

    });
}]);
