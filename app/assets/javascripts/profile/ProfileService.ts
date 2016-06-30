/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.profile")
.service('profileService', ['$http', function($http: angular.IHttpService) {
    this.editProfile = function(args) {
        return  $http({
          url: "/profile",
          method: 'PUT',
          params: args
        });
    };

    this.getProfile = function(username) {
        return  $http.get("/profile/" + username + ".json");
    };
}]);
