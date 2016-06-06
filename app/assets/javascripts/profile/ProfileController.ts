/// <reference path="../../typings/angular.d.ts" />
/// <reference path="../../typings/jquery.d.ts" />

angular.module("fuzzydodb.profile", [])
  .controller("ProfileController", ["$scope", "$http", "profileService",
    function($scope, $http, profileService) {

      profileService.getProfile({email: $scope.actorEmail})
        .then(function(response) {
          $scope.user = response.data;
        });

  }])

  // example Fiddle: https://jsfiddle.net/alexk111/rw6q9/
  .controller("ProfilePhotoController", ["$scope",
    function($scope) {

      var defaultPhoto = "/assets/team/default.png";

      $scope.originalPhoto = $(".preview-photo img").attr('src');
      $scope.myImage = $scope.originalPhoto;
      $scope.myCroppedImage = $scope.originalPhoto;
      $scope.selectedFile = '';

      $scope.isDefaultPhoto = $scope.originalPhoto === defaultPhoto;

      var handleFileSelect = function(evt: Event) {

        var currentTarget: any = evt.currentTarget;
        var file: File = currentTarget.files[0];
        var reader = new FileReader();

        $scope.selectedFile = file.name;

        reader.onload = function(evt) {

          $scope.$apply(function($scope) {

            var target: any = evt.target;
            $scope.myImage = target.result;
            $scope.isDefaultPhoto = false;
          });
        };
        reader.readAsDataURL(file);
      };

      // resets changes
      $scope.resetPhoto = function() {
        $scope.myImage = $scope.originalPhoto;
        $scope.selectedFile = '';
        $scope.isDefaultPhoto = $scope.originalPhoto === defaultPhoto;
      }

      // deletes photo locally and set the default
      $scope.deletePhoto = function() {
        $scope.myImage = defaultPhoto;
        $scope.selectedFile = '';
        $scope.isDefaultPhoto = true;
      }

      angular.element(document.querySelector('#fileInput')).on('change', handleFileSelect);
  }]);

