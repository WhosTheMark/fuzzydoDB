/// <reference path="../typings/angular.d.ts" />
/// <reference path="../typings/angular-route.d.ts" />

var app = angular.module("fuzzydodb", [

  // Angular libs
  "ngRoute",
  "templates",
  "pascalprecht.translate",
  // FuzzydoDB modules
  "fuzzydodb.home"])

  .config(["$routeProvider", "$locationProvider",
    function($routeProvider, $locationProvider) {
      $routeProvider
        .when("/:language", {
          templateUrl: "home/_home.html",
          controller: "HomeController"
        })
        .when("/", {
          templateUrl: "home/_home.html",
          controller: "HomeController"
        });

      $locationProvider.html5Mode(true);
    }])

app

.config(['$translateProvider', function ($translateProvider) {
  $translateProvider.preferredLanguage('es');
  $translateProvider.translations('en', {
    'university-footer': 'Hello',
  });
 
  $translateProvider.translations('es', {
    'university-footer': 'Hola',
  });
 
}]);
