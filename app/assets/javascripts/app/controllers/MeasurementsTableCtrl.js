app.controller('MeasurementsTableCtrl', ['$scope', '$resource', '$filter', 'ngTableParams', function($scope, $resource, $filter, ngTableParams) {
  var Measurement = $resource('/members/' + window.member_id + '/measurements.json');


  $scope.xAxisTickFormatFunction = function(){
        return function(d){
            return d3.time.format('%x')(new Date(d*1000));
        }
    }

                  //  Base        High        Low 
  var colorArray = ['#75caeb', '#ff4136', '#ff851b'];
  $scope.colorFunction = function() {
    return function(d, i) {

      console.log('ll ' + d[1] + ' ' + i + ' ' + d);

        if (d[1] >= 125) {
          return colorArray[1];
        } 
        else if (d[1] < 125 && d[1] >= 100)
        {
          return colorArray[0];
        }
        else if (d[1] < 100)
        {
          return colorArray[2];
        }

    };
  }

  $scope.measurements = Measurement.query(function(response)
    {

      $scope.chartData = [{ "key": "Glucose Readings",
                                  "values": [] }];

      angular.forEach(response, function (item) {
          $scope.chartData[0]["values"].push([item.measured_at, item.glucose_value]);
      });

      $scope.tableParams = new ngTableParams({
          page: 1,            // show first page
          count: 10,          // count per page
          sorting: {
            created_at: 'desc'     // initial sorting
          }
      }, {
          total: $scope.measurements.length, // length of data
          getData: function($defer, params) {

            var filteredData = $filter('filter')($scope.measurements, $scope.filter);

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
