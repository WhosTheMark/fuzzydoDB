/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.user", [])
  .controller("UserController", ["$scope", "UserService",
    function($scope, userService) {

    $scope.users = {};
    $scope.selectedUser = null;
    $scope.userTable = {};

    $scope.$watch('userTable.$dirty', function(newValue, oldValue) {
      if($scope.userTable.$dirty){
        window.onbeforeunload = function() { return "" };
      } else {
        window.onbeforeunload = null;
      }
    })

    $scope.saveRoles = function() {

      $scope.userTable.$pending = true;

      // Get all dirty fields
      // as seen at http://stackoverflow.com/questions/20908096/getting-form-controls-from-formcontroller
      var dirtyFormControls = [];

      // gets the form, defined as a div in the view
      // ng-form adds dirty to all input fields when needed
      var myForm = $scope.userTable;
      angular.forEach(myForm, function(value, key) {
        if (typeof value === 'object' && value.hasOwnProperty('$modelValue') && value.$dirty)
          dirtyFormControls.push({ username: value.$name, role: value.$modelValue });
      });

      userService.changeRoles(dirtyFormControls)
        .then(function(response) {
          window.onbeforeunload = null;
          location.reload();
        }, function(reason) {
          alert("Something bad happened: " + reason);
        }, function() {
          $scope.userTable.$pending = false;
        });
    }

    $scope.transferRole = function() {
      userService.transferRole($scope.selectedUser)
        .then(function(response){
          window.location.href = "/";
        }, function(reason) {
          alert("Something bad happened: " + reason);
        });
    }

    $scope.selectUser = function(user){
      $scope.selectedUser = user;
    }

  }]);