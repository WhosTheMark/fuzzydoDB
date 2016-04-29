/// <reference path="../typings/angular.d.ts" />

angular.module("fuzzydodb.header", ["ngRoute"])
    .controller("HeaderController", ["$scope","$location",
       function($scope, $location) {
         $scope.sendTo = function(path) {
           $location.path(path);
         };
    }]);

