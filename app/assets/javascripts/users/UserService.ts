/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.user")
  .factory("UserService", ["$http", "$q", function($http, $q){
    return {
      validateUser: function(viewValue) {
        //return the promise directly.
        return $http.post('/users/validateUsername/', { username: viewValue })
          .then(function(result) {
            //resolve the promise as the data

            if(!result.data) {
              return $q.reject(result.data.errorMessage);
            }

            return true;
          });
      }
    }
  }])