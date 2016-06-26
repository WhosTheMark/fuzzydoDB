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

  // example Fiddle: https://jsfiddle.net/alexk111/rw6q9/
  .controller("ProfilePhotoController", ["$scope", "$http",
    function($scope, $http: angular.IHttpService) {

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


      /**
   * Converts data uri to Blob. Necessary for uploading.
   * @see
   *   https://github.com/nervgh/angular-file-upload/issues/208#issuecomment-56482050
   *   http://stackoverflow.com/questions/4998908/convert-data-uri-to-file-then-append-to-formdata
   * @param  {String} dataURI
   * @return {Blob}
   */
      var dataURItoBlob = function(dataURI) {
        var binary = atob(dataURI.split(',')[1]);
        var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
        var array = [];
        for (var i = 0; i < binary.length; i++) {
          array.push(binary.charCodeAt(i));
        }
        return new Blob([new Uint8Array(array)], { type: mimeString });
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

        $http.delete("/profile/destroy_avatar.json").then(function() {
          location.reload();
        });
      }

      $scope.sendPhoto = function() {
        var blob = dataURItoBlob($scope.myCroppedImage);
        var formData = new FormData();
        formData.append('file', blob, $scope.selectedFile);
        $http.put("/profile/update_avatar.json", formData, {
          transformRequest: angular.identity,
          headers: { 'Content-Type': undefined }
        }).then(function() {
          location.reload();
        })
      }

      angular.element(document.querySelector('#fileInput')).on('change', handleFileSelect);

  }]);
