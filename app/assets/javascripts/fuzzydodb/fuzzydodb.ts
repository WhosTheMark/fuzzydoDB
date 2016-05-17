/// <reference path="../../typings/angular.d.ts" />

var app = angular.module("fuzzydodb", [

  // Dependencies
  "ngMessages",

  // FuzzydoDB modules
  "fuzzydodb.user"
]);

interface Function {
    commitViewValue(): boolean;
}

// As seen 0n: https://toresenneseth.wordpress.com/2014/08/10/update-the-model-on-enter-key-pressed-with-angularjs/
app.directive("updateModelOnEnterKeyPressed", function() {
            return {
                restrict: 'A',
                require: 'ngModel',
                link: function (scope, elem, attrs, ngModelCtrl) {
                    elem.bind("keyup",function(e) {
                        var ngModelCtrl : angular.INgModelController;
                        if (e.keyCode === 13) {
                            ngModelCtrl.$commitViewValue();
                        }
                    });
                }
            }
        });
