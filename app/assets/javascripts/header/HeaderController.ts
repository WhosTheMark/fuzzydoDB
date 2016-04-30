/// <reference path="../typings/angular.d.ts" />

angular.module("fuzzydodb.header", [])
    .controller("HeaderController", ["$scope","$window",
       function($scope, $window) {
         $scope.sendTo = function(path) {
           $window.location.href = path;
         };
    }]);

