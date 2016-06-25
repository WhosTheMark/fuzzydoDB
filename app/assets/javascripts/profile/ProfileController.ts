/// <reference path="../../typings/angular.d.ts" />
/// <reference path="../../typings/jquery.d.ts" />

angular.module("fuzzydodb.profile", [])
  .controller("ProfileController", ["$scope", "$http", "profileService",
    function($scope, $http, profileService) {

      profileService.getProfile({email: $scope.actorEmail})
        .then(function(response) {
          $scope.user = response.data;
        });

  }]);

