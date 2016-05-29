/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.user")
  .factory("UserService", ["$http", "$q", function($http, $q: angular.IQService){

    return {
      changeRoles: function(changedUsers) {
        return $http.put("users/changeRoles.json", { users: changedUsers });
      }
    }

  }]);