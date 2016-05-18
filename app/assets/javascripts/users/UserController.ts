/// <reference path="../../typings/angular.d.ts" />
/// <reference path="../../typings/jquery.d.ts" />

angular.module("fuzzydodb.user", [])
  .controller("UserController", ["$scope", function($scope) {

    $scope.loginUser = {};
    $scope.registerUser = {};

    $scope.submitLogin = function($event) {

      // Forces form validation using angular onBlur
      $(':focus').blur();
      $scope.loginForm.$submitted = true;

      if ($scope.loginForm.$invalid) {
        $event.preventDefault();
      };
    };

    $scope.submitRegistration = function($event) {

      // Forces form validation using angular onBlur
      $(':focus').blur();
      $scope.registrationForm.$submitted = true;

      if ($scope.registrationForm.$invalid) {
        $event.preventDefault();
      };
    };
  }])

  // Custom validator
  // As seen at: http://odetocode.com/blogs/scott/archive/2014/10/13/confirm-password-validation-in-angularjs.aspx
  .directive("equalPasswords", function() {
    return {
      require: "ngModel",
      scope: {
        otherModelValue: "=equalPasswords"
      },
      link: function(scope, elem, attrs, ctrl: angular.INgModelController) {
        ctrl.$validators.equalPasswords = function(modelValue, viewValue) {
          return modelValue == scope.otherModelValue;
        };

        scope.$watch("otherModelValue", function() {
          ctrl.$validate();
        });
      }
    };
  })

  // Custom async validator
  // Checks if the username is taken
  .directive("usernameValidator", ["$http", "$q", function($http, $q){
    return {
      require: "ngModel",
      link: function(scope, element, attrs, ngModel: angular.INgModelController) {
        ngModel.$asyncValidators.username = function(modelValue, viewValue) {
          return $http.post('/users/validateUsername/', { username: viewValue }).then(
            function(response) {

              //if not valid reject
              if (!response.data) {
                return $q.reject(response.data.errorMessage);
              }
              return true;
            }
          );
        };
      }
    }
  }])
