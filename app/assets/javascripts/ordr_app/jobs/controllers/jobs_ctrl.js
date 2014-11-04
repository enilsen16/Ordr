var app = angular.module('ordrApp');

  app.controller('JobsCtrl', [ '$http', "$scope", function($http, $scope){
    $scope.jobs = [];

    $scope.errors = [];

    $scope.index = function() {
      $http.get('/jobs')
        .success(function(data) {
          $scope.jobs = data;
        })
        .error(function(data, status) {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        });
    };

    $scope.create = function(job) {
      $http.post('/jobs', {job: job})
        .success(function(data) {
          $scope.jobs.push(data);
        })
        .error(function(data, status) {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        })
    };

    $scope.update = function(job) {
      $http({
        method: 'PATCH',
        url: '/jobs/' + job.id,
        data: job
      })
        .success(function() {
          job.editing = false;
        })
        .error(function(data, status) {
          $scope.errors += data;
          console.log(data);
          console.log(status);
        })
    };

    $scope.destroy = function(job) {
      $http({
        method: 'DELETE',
        url: '/jobs/' + job.id
      })
        .success(function() {
          job.deleteConfirm = false;
          $scope.jobs.splice($scope.jobs.indexOf(job), 1);
        })
        .error(function() {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        });
    };
} ]);