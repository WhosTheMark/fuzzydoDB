/// <reference path="../typings/angular.d.ts" />

angular.module("fuzzydodb.home", [])
    .controller("HomeController", ["$scope", "$translate", function($scope,$translate) {
        $scope.message = "Hello no cableado por angular";
        $scope.changeLang =  function(lang : String){
          $translate.use(lang);
        }
    }]);
