/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.user", [])
  .controller("UserController", ["$scope", function($scope) {

    $scope.loginUser = {};
    $scope.registerUser = {};

    $scope.submitLogin = function($event) {

      $scope.loginForm.$submitted = true;

      if ($scope.loginForm.$invalid) {
        $event.preventDefault();
      };
    };

    $scope.submitRegistration = function($event) {

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
  });
