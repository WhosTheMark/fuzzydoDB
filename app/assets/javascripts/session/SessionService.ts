/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.session")
  .service("SessionService", ["$http", "$q", function($http, $q: angular.IQService){

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


    this.validateUsername = function(viewValue) {

      return validateField('/users/validateUsername/', { username: viewValue });
    }

    this.validateEmail = function(viewValue) {
      return validateField('/users/validateEmail/', { email: viewValue });
    }

    this.logIn = function(user){

      var deferred = $q.defer();

      $http.post("/en/users/sign_in.json", user)
        .then(function(response) {
          //resolve the promise as the data
          deferred.resolve(response.data);
        }, function(reason) {
          deferred.reject(reason);
      });

      return deferred.promise;
    }
  }])