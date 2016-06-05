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
}]);
