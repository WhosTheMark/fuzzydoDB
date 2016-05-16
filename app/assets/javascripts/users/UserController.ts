/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.user", [])
  .controller("UserController", ["$scope", function($scope) {

    $scope.loginUser = {};
    $scope.registerUser = {};

    $scope.submitLogin = function($event) {

      $scope.loginForm.$submitted = true;

      if ($scope.loginForm.$invalid) {
        $event.preventDefault();
      };
    };

    $scope.submitRegistration = function($event) {

      $scope.registrationForm.$submitted = true;

      if ($scope.registrationForm.$invalid) {
        $event.preventDefault();
      };
    };

  }]);