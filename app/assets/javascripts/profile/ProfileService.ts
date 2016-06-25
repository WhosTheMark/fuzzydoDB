/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.profile")
.service('profileService', ['$http', function($http) {
    this.editProfile = function(args) {
        return  $http({
          url: "/profile",
          method: 'PUT',
          params: args
        });
    };

    this.getProfile = function(args) {
        return  $http({
          url: "/profile/" ,
          method: 'GET',
          params: args
        });
    };

    this.deleteProfilePhoto = function() {
       return $http.delete("/profile/destroy_avatar.json");
    }

    this.updateProfilePhoto = function(formData: FormData) {
      return $http.put("/profile/update_avatar.json", formData, {
          transformRequest: angular.identity,
          headers: { 'Content-Type': undefined }
        })
    }
}]);
