/// <reference path="../../typings/angular.d.ts" />
/// <reference path="../../typings/jquery.d.ts" />

angular.module("fuzzydodb.profilePhoto", [])

 // example Fiddle: https://jsfiddle.net/alexk111/rw6q9/
  .controller("ProfilePhotoController", ["$scope", 'profileService', "$http",
    function($scope, profileService, $http: angular.IHttpService) {

      var defaultPhoto = "/assets/team/default.png";

      $scope.originalPhoto = $(".preview-photo img").attr('src');
      $scope.myImage = $scope.originalPhoto;
      $scope.myCroppedImage = $scope.originalPhoto;
      $scope.selectedFile = '';

      $scope.isDefaultPhoto = $scope.originalPhoto === defaultPhoto;
      $scope.areChangesMade = false;

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
            $scope.areChangesMade = true;
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
        $scope.areChangesMade = false;
      }

      // deletes photo locally and set the default
      $scope.deletePhoto = function() {
        $scope.myImage = defaultPhoto;
        $scope.selectedFile = '';
        $scope.isDefaultPhoto = true;

        profileService.deleteProfilePhoto().then(function() {
          location.reload();
        });
      }

      // Sends photo to the server
      $scope.sendPhoto = function() {
        var blob = dataURItoBlob($scope.myCroppedImage);
        var formData = new FormData();
        formData.append('file', blob, $scope.selectedFile);

        profileService.updateProfilePhoto(formData).then(function() {
          location.reload();
        })
      }

      angular.element(document.querySelector('#fileInput')).on('change', handleFileSelect);
  }]);