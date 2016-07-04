/// <reference path="../../typings/angular.d.ts" />
/// <reference path="../../typings/jquery.d.ts" />

angular.module("fuzzydodb.login", [])
  .controller("LoginController", ["$scope", "SessionService",
    function($scope, sessionService) {

      $scope.loginUser = {};
      $scope.loginError = false;

      $scope.submitLogin = function($event) {

        // Forces form validation using angular onBlur
        $(':focus').blur();
        $scope.loginForm.$submitted = true;

        // if it is invalid, don't send the form
        if ($scope.loginForm.$invalid) {
          $event.preventDefault();
        } else {
          $event.preventDefault();
          $scope.loginForm.$pending = true;
          $scope.loginError = false;

          // creates user using form
          var user = {
            user: {
              email: $scope.loginUser.email,
              password: $scope.loginUser.password,
              remember_me: $scope.loginUser.rememberMe
            }
          }

          // refresh page on success
          sessionService.logIn(user)
            .then(function(response){
              location.reload();
            }, function(reason){
              $scope.loginError = true;
            })
            .finally(function(){
              $scope.loginForm.$pending = false;
            });
        };
      };
  }]);
