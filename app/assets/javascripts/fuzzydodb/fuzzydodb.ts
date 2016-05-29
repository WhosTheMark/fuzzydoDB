/// <reference path="../../typings/angular.d.ts" />
/// <reference path="../../typings/jquery.d.ts" />

var app = angular.module("fuzzydodb", [

  // Dependencies
  "ngMessages",

  // FuzzydoDB modules
  "fuzzydodb.session",
  "fuzzydodb.user"
]).run(function($http : angular.IHttpService) {
  $http.defaults.headers.post['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');
  $http.defaults.headers.put['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');
});
