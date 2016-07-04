/// <reference path="../../typings/angular.d.ts" />
/// <reference path="../../typings/jquery.d.ts" />

angular.module("fuzzydodb.registration", [])
  .controller("RegistrationController", ["$scope",
    function($scope) {


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
  .directive("usernameTakenValidator", ["SessionService", "fieldAsyncValidatorFactory",
    function(sessionService, fieldAsyncValidatorFactory) {
      return {
        require: "ngModel",
        link: function(scope, element, attrs, ngModel: angular.INgModelController) {

          ngModel.$asyncValidators.usernameTaken = function(modelValue, viewValue){

            return fieldAsyncValidatorFactory
              .validator(viewValue, sessionService.validateUsername, "An error ocurred validating the username ");
          }
        }
      }
  }])

  .directive("emailTakenValidator", ["SessionService", "fieldAsyncValidatorFactory",
    function(sessionService, fieldAsyncValidatorFactory) {
      return {
        require: "ngModel",
        link: function(scope, element, attrs, ngModel: angular.INgModelController) {

          ngModel.$asyncValidators.emailTaken = function(modelValue, viewValue) {

            return fieldAsyncValidatorFactory
              .validator(viewValue, sessionService.validateEmail, "An error ocurred validating the email ");
          }
        }
      }
  }])

  // functions added to asyncValidators must return a promise
  // rejected when its invalid, resolved valid
  .factory("fieldAsyncValidatorFactory", ["$q", function($q : angular.IQService){
    return {
      validator: function(viewValue, serviceFunc, errorMsg) {
        var deferred = $q.defer();

        var valid = serviceFunc(viewValue)
          .then(function(response) {

            // if username is valid, resolve
            if (response) {
              deferred.resolve();
            } else {
              deferred.reject();
            }

          }, function(reason) {
            alert(errorMsg + reason);
            return $q.reject();
          });

        return deferred.promise;
      }
    }
  }])
