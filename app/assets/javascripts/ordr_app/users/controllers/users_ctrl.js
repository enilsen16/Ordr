(function() {
  var app = angular.module('ordrApp');
  app.controller('UsersCtrl', ['$scope', '$http', '$cookieStore', '$location', function($scope, $http, $cookieStore, $location) {
    $scope.create = function(user) {
      data = {user: user};
      $http.post('/users', data) {
        .success(function(data) {
          $scope.newUser = {};
          $cookieStore.put('current_user', data);
          $location.path('/jobs')
        })
        .error(function(data, status) {
          console.log(data);
          console.log(status);
        });
    };

    $scope.signIn = function(user) {
     data = {user: user};
     $http.post('/login', data)
      .success(function(data) {
        $scope.user = {};
        $cookieStore.put('current_user', data);
        $location.path('/jobs');
      })
      .error(function(data, status) {
        console.log(data);
        console.log(status);
      });
    };

    $scope.signOut = function() {
      $http({
        method: 'GET',
        url: '/logout'
      })
        .success(function() {
          $cookieStore.remove('current_user');
        })
        .error(function(status) {
          console.log(status);
        })
    };

  }]);
})()