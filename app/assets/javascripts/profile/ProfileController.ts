/// <reference path="../../typings/angular.d.ts" />
/// <reference path="../../typings/jquery.d.ts" />

angular.module("fuzzydodb.profile", [])
  .controller("profileController", ["$scope", "$http", "profileService",
    function($scope, $http, userService) {

      $scope.user = {name: "John", email: "pexison@gmail.com", country: "Qongo"};
      $scope.loginUser = {};
      $scope.registerUser = {};
      $scope.loginError = false;

  }])

