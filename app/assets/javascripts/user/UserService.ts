/// <reference path="../../typings/angular.d.ts" />

angular.module("fuzzydodb.user")
  .service("UserService", ["$http", function($http){

      this.changeRoles = function(changedUsers) {
        return $http.put("users/changeRoles.json", { users: changedUsers });
      }

      this.transferRole = function(user_id) {
        return $http.post("/es/admin/transferRole", { id: user_id });
      }
  }]);