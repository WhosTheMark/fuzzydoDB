/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.user")
  .factory("UserService", ["$http", "$q", function($http, $q: angular.IQService){

    // generic validate field
    var validateField = function(path: string, object){
      var deferred = $q.defer();

      $http.post(path, object)
        .then(function(response) {
          //resolve the promise as the data
          deferred.resolve(response.data);
        }, function(reason) {
          deferred.reject(reason);
        });

      return deferred.promise;
    }

    return {
      validateUsername: function(viewValue) {

        return validateField('/users/validateUsername/', { username: viewValue });
      },

      validateEmail: function(viewValue) {
        return validateField('/users/validateEmail/', { email: viewValue });
      }
    }
  }])