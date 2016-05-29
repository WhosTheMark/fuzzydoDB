/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.user", [])
  .controller("UserController", ["$scope", "$http", "UserService",
    function($scope, $http: angular.IHttpService, userService) {

    $scope.users = {};

    $scope.saveRoles = function() {

      // Get all dirty fields
      // as seen at http://stackoverflow.com/questions/20908096/getting-form-controls-from-formcontroller
      var dirtyFormControls = [];

      // gets the form, defined as a div in the view
      // ng-form adds dirty to all input fields
      var myForm = $scope.userTable;
      angular.forEach(myForm, function(value, key) {
        if (typeof value === 'object' && value.hasOwnProperty('$modelValue') && value.$dirty)
          dirtyFormControls.push({ username: value.$name, role: value.$modelValue });
      });

      userService.changeRoles(dirtyFormControls)
        .then(function(response){
          location.reload();
        }, function(reason){
          alert("Something bad happened: " + reason);
        });
    }

  }]);