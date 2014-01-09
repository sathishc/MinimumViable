define([
    'jquery','angular','util','userService'],
    function($,angular,util,userService){

        'use strict';

        /* Controllers */

        var headerControllerModule = angular.module('headerController', []);



        headerControllerModule.controller('HeaderControl', ['$scope','$http','user',function ($scope,$http,userService) {



            $scope.md5Name = 'none';
            $scope.firstName = "";
            $scope.lastName = "";


            $scope.fullName = function() {
                return $scope.firstName + ' ' + $scope.lastName;
            };

            $scope.profilePicture = function() {
                return 'https://secure.gravatar.com/avatar/' + $scope.md5Name + '?r=g&s=24&d=mm';
            };

            $scope.isVisible = function() {
                return $scope.md5Name != 'none';
            };


            $scope.init = function(){


            };

            $scope.bindEvents = function(){


                    userService.getUserData().then(function(userData){


                        setTimeout(function(){
                            $scope.$apply(function(){
                                $scope.md5Name = userData.md5Name;
                                $scope.firstName = userData.firstName;
                                $scope.lastName = userData.lastName;
                            });
                        },100);


                    });

            };


            $scope.init();
            $scope.bindEvents();

        }]);



    });




