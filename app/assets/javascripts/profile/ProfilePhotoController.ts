/// <reference path="../../typings/angular.d.ts" />

// example Fiddle: https://jsfiddle.net/alexk111/rw6q9/
angular.module("fuzzydodb.profile", [])
  .controller("ProfilePhotoController", ["$scope",
    function($scope) {

      $scope.myImage = '';
      $scope.myCroppedImage = '';

      var handleFileSelect = function(evt: Event) {

        var currentTarget: any = evt.currentTarget;
        var file: Blob = currentTarget.files[0];
        var reader = new FileReader();

        reader.onload = function(evt) {

          $scope.$apply(function($scope) {

            var target: any = evt.target;
            $scope.myImage = target.result;
          });
        };

        reader.readAsDataURL(file);
      };

      angular.element(document.querySelector('#fileInput')).on('change', handleFileSelect);
    }]);