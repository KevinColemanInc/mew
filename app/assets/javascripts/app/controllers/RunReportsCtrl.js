app.controller('RunReportsCtrl', ['$scope', '$resource', '$filter', 'ngTableParams', function($scope, $resource, $filter, ngTableParams) {
  var Report = $resource('/api/v1/reports/:id/:action', { id: window.report_id },
       {
           'getResults': { params: {id: window.report_id, action: 'run.json'}, method: 'GET', isArray: false }
       });

  $scope.expr = function(expression) {
    console.log('kkk');
    console.log(expression);
    return expression;
    }

  $scope.results = Report.getResults(function(response)
    {
      console.log($scope.results.table.headers);
      console.log($scope.results.table.rows);
      $scope.tableParams = new ngTableParams({
          page: 1,            // show first page
          count: 10
      }, {
          total: $scope.results.table.rows, // length of data
          getData: function($defer, params) {

            var filteredData = $filter('filter')($scope.results.table.rows, $scope.filter);

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
