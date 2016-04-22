// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/// <reference path="typings/angular.d.ts" />
/// <reference path="typings/angular-resource.d.ts" />


angular.module('root', [])
    .controller("index", ["$scope", function ($scope) {
        $scope.message = "Hello World in AngularJS :D !";
    }]);

