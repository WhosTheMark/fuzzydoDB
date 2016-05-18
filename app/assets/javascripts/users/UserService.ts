/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.user")
  .factory("UserService", ["$http", "$q", function($http, $q: angular.IQService){

    return {
      validateUser: function(viewValue) {

        var deferred = $q.defer();

        $http.post('/users/validateUsername/', { username: viewValue })
          .then(function(response) {
            //resolve the promise as the data
            deferred.resolve(response.data);
          }, function(reason){
            deferred.reject(reason);
          });

        return deferred.promise;
      }
    }
  }])