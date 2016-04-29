/// <reference path="../typings/angular.d.ts" />
/// <reference path="../typings/angular-route.d.ts" />

angular.module("fuzzydodb", [

    // Angular libs
    "ngRoute",
    "templates",
    // FuzzydoDB modules
    "fuzzydodb.home"])

    .config(["$routeProvider", "$locationProvider",
        function($routeProvider, $locationProvider) {
            $routeProvider
                .when("/", {
                    templateUrl: "home/_home.html",
                    controller: "HomeController"
                })
                .when("/aboutus", {
                    templateUrl: "home/_about.html",
                    controller: "HomeController"
                });

            $locationProvider.html5Mode(true);
    }])
