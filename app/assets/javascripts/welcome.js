// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
angular.module('root', [])
    .controller("index", ["$scope", function ($scope) {
        $scope.message = "Hello World in AngularJS :D !";
    }]);
