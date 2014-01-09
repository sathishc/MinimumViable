define([
    'jquery','angular','util','userService'],
    function($,angular,util,userService){

        'use strict';

        /* Controllers */

        var userControllerModule = angular.module('userController', []);



        userControllerModule.controller('UserControl', ['$scope','$http','user',function ($scope,$http,userService) {


            $scope.isDirty = false;
            $scope.userName = '';
            $scope.md5Name = 'none';
            $scope.image = '';

            $scope.selectedPredictionNotificationSetting = 0;
            $scope.selectedFeatureNotificationSetting = 0;
            $scope.isNotificationDirty = false;

            $scope.firstName = "";
            $scope.lastName = "";

            $scope.genderOptions = ['Male','Female'];
            $scope.gender = '';
            $scope.generalDetails = '';
            $scope.isProfileDirty = false;

            $scope.isPersonaSession = '';
            $scope.profileLoaded = false;


            $scope.fullName = function() {
                return $scope.firstName + ' ' + $scope.lastName;
            };

            $scope.profilePicture = function() {
                return 'https://secure.gravatar.com/avatar/' + $scope.md5Name + '?r=g&s=24&d=mm';
            };

            $scope.profilePictureForSettings = function() {
                return 'https://secure.gravatar.com/avatar/' + $scope.md5Name + '?r=g&s=24&d=mm';
            };

            $scope.$watch('selectedPredictionNotificationSetting',function(){
                $scope.isNotificationDirty = true;
            });

            $scope.$watch('selectedFeatureNotificationSetting',function(){
                $scope.isNotificationDirty = true;
            });

            $scope.$watch('firstName',function(){
                $scope.isProfileDirty = true;
            });

            $scope.$watch('lastName',function(){
                $scope.isProfileDirty = true;
            });


            $scope.$watch('generalDetails',function(){
                $scope.isProfileDirty = true;
            });

            $scope.$watch('gender',function(){
                $scope.isProfileDirty = true;
            });

            $scope.profileFormParameters = function(){
                return {
                    firstName:$scope.firstName,
                    lastName:$scope.lastName,
                    gender:$scope.gender,
                    generalDetails:$scope.generalDetails
                };
            };

            $scope.notificationFormParameters = function(){
                return {
                    featureNotification:$scope.selectedFeatureNotificationSetting
                };
            };

            $scope.init = function(){


            };

            $scope.bindEvents = function(){

                    $('input.updateProfileSettingsButton').unbind();
                    $('input.updateProfileSettingsButton').on('click',updateProfileSettings);

                    $('input.updateNotificationSettingsButton').unbind();
                    $('input.updateNotificationSettingsButton').on('click',updateNotificationSettings);

                    userService.getServerUserData().then(function(userData){


                            setTimeout(function(){
                                $scope.$apply(function(){
                                    $scope.userName = userData.userName;
                                    $scope.md5Name = userData.md5Name;
                                    $scope.firstName = userData.firstName;
                                    $scope.lastName = userData.lastName;
                                    $scope.gender = userData.gender;
                                    $scope.generalDetails = userData.generalDetails;
                                    $scope.isPersonaSession = userData.isPersonaSession;
                                    $scope.selectedFeatureNotificationSetting = userData.featureNotificationFrequency;

                                    $scope.profileLoaded = true;
                                });
                            },100);

                    });

            };

            function updateProfileSettings(){
                $('input.updateProfileSettingsButton').button('loading');
                /*amplify.request('updateProfileSettings',userModel.profileformParameters(),function (data,textStatus){
                    if(data.status){

                        userModel.firstName(data.firstName);
                        userModel.lastName(data.lastName);
                        userModel.gender(data.gender);
                        userModel.generalDetails(data.generalDetails);


                        userModel.isProfileDirty(false);
                    }
                    $('input.updateProfileSettingsButton').button('reset');
                });*/
            }

            function updateNotificationSettings(){
                $('input.updateNotificationSettingsButton').button('loading');
                /*amplify.request('updateNotificationSettings',userModel.notificationformParameters(),function updateNotificationSettingsModel(data,textStatus){
                    if(data.status){

                        userModel.selectedFeatureNotificationSetting(data.featureNotificationFrequency);
                        userModel.isNotificationDirty(false);

                    }
                    $('input.updateNotificationSettingsButton').button('reset');
                });*/
            }

            $scope.init();
            $scope.bindEvents();

        }]);



    });




