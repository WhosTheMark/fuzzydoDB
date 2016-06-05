/// <reference path="../../typings/angular.d.ts" />
/// <reference path="../../typings/jquery.d.ts" />

angular.module("fuzzydodb.profile", [])
  .controller("ProfileController", ["$scope", "$http", "ngRoute", "profileService",
    function($scope, $http, $routeParams, profileService) {

      $scope.userId = $routeParams.paramId1;
      profileService.getProfile({email: $scope.actorEmail})
        .then(function(response) {
          $scope.user = response.data;
        });

  }])

