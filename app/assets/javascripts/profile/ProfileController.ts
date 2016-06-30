/// <reference path="../../typings/angular.d.ts" />
/// <reference path="../../typings/jquery.d.ts" />

angular.module("fuzzydodb.profile", [])
  .controller("ProfileController", ["$scope", "$http", "profileService",
    function($scope, $http, profileService) {

      var username = $("#user_username").attr("value");

      profileService.getProfile(username)
        .then(function(response) {
          $scope.user = response.data;
        });

      /* don't send the form if it has errors */
      $scope.sendProfile = function(event) {

        // Forces form validation using angular onBlur
        $(':focus').blur();

        if ($scope.editForm.$invalid) {
          event.preventDefault();
        }
      }

  }]);
