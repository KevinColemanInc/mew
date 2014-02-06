app.controller('CommunicationDevicesTableCtrl', ['$scope', '$resource', '$filter', 'ngTableParams', function($scope, $resource, $filter, ngTableParams) {
  var CommunicationDevice = $resource('/communication_devices.json');

  $scope.$watch("filter.$", function () {
      $scope.tableParams.reload();
    });

  $scope.communication_devices = CommunicationDevice.query(function(response)
    {
      $scope.tableParams = new ngTableParams({
          page: 1,            // show first page
          count: 10,          // count per page
          sorting: {
            created_at: 'asc'     // initial sorting
          }
      }, {
          total: $scope.communication_devices.length, // length of data
          getData: function($defer, params) {

            var filteredData = $filter('filter')($scope.communication_devices, $scope.filter);

            var orderedData = params.sorting() ?
                                $filter('orderBy')(filteredData, params.orderBy()) :
                                filteredData;
            params.total(orderedData.length); // set total for recalc pagination

            $defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
          }, $scope: $scope
      });
    });
}]);
