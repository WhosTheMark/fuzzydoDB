/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.user", [])
  .controller("UserController", ["$scope", function($scope) {
    $scope.loginUser = {};
  }]);