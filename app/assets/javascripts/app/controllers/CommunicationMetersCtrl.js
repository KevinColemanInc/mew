app.controller('CommunicationDevicesCtrl', ['$scope', '$resource', function($scope, $resource) {
  var CommunicationDevice = $resource('/communication_devices/:id?format=json', {userId:'@id'},
      {
          'update': { method:'PATCH', url: '/communication_devices/:id?format=json' },
          'query' : { method:'GET', url: '/communication_devices?format=json', isArray: true }
      });

  $scope.new_communication_devices = CommunicationDevice.query({not_for_meter_id: window.meter_id});
  $scope.meter_communication_devices = CommunicationDevice.query({for_meter_id: window.meter_id});


  $scope.addCommunicationDevice = function(communication_device) {

     CommunicationDevice.update({id:communication_device.id, add_meter_id: window.meter_id}, null, function (response) {     
      $scope.new_communication_devices = CommunicationDevice.query({not_for_meter_id: window.meter_id});
      $scope.meter_communication_devices = CommunicationDevice.query({for_meter_id: window.meter_id});                   
    });

  };

  $scope.removeCommunicationDevice = function(communication_device) {
    CommunicationDevice.update({ id: communication_device.id, remove_meter_id: window.meter_id }, null, function (response) {     
        $scope.new_communication_devices = CommunicationDevice.query({not_for_meter_id: window.meter_id});
        $scope.meter_communication_devices = CommunicationDevice.query({for_meter_id: window.meter_id});               
    });
  
  };

}]);