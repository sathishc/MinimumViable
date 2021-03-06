define([
    'jquery','angular','util'],
    function($,angular,util){

        'use strict';

        /* Controllers */

        var pageController =  angular.module('pageController', []);


        pageController.controller('PageControl',
            ['$scope','$location','user',
                function ($scope,$location,userService) {


            $scope.url = "home";
            $scope.loggingIn = false;
            $scope.loggingInStyle = "{display:none;}";
            $scope.selectedPage = 'Page1';


            $scope.selectPage = function(value){
                $scope.selectedPage = value;
            };



            $scope.isPersonaSession = false;


            $scope.profileLoaded = function(){
                return userService.isUserDataLoaded();
            };

            $scope.$watch('selectedPage',function(newValue, OldValue){
                if(newValue != OldValue){
                    $location.path(newValue);
                }

            });


            $scope.bindEvents = function(useremail){
                var loggedInUser = null;
                if($scope.isPersonaSession){
                    loggedInUser = useremail
                }


                navigator.id.watch({
                    loggedInUser: loggedInUser,
                    onlogin: function(assertion) {
                        // A user has logged in! Here you need to:
                        // 1. Send the assertion to your backend for verification and to create a session.
                        // 2. Update your UI.
                        disableSignupButton();
                        $.ajax({


                            type: 'POST',
                            url: '/socialLogin/persona', // This is a URL on your website.
                            data: {assertion: assertion},
                            success: function(res, status, xhr) {
                                //console.log(res);
                                window.location.reload();
                            },
                            error: function(xhr, status, err) {
                                navigator.id.logout();
                                alert("Login failure: " + err);
                            }
                        });
                    },
                    onlogout: function() {
                        // A user has logged out! Here you need to:
                        // Tear down the user's session by redirecting the user or making a call to your backend.
                        // Also, make sure loggedInUser will get set to null on the next page load.
                        // (That's a literal JavaScript null. Not false, 0, or undefined. null.)
                        if($scope.isPersonaSession() && loggedInUser){
                            logoutUser();
                        }

                    }
                });

                $("a[rel=popover]")
                    .popover()
                    .click(function(e) {
                        e.preventDefault()
                    });

                $('#personaLoginButton').on('click',function(){
                    if(window.location.hostname == 'localhost'){
                        navigator.id.request();
                    }else{
                        navigator.id.request({siteName: 'Minimum Viable', siteLogo: '/img/Om.png',termsOfService: '/terms', privacyPolicy: '/privacy'});
                    }


                });

                $('#logoutLink').on('click',function(){
                    if($scope.isPersonaSession){
                        navigator.id.logout();
                    }else{
                        logoutUser();
                    }
                    return false;

                });



                $.ajaxSetup({statusCode:{401:function(){
                    $('#sessionTimeoutDialog').modal('show');
                }}});

                $('.popupHelpCloseButton').on('click',function(){
                    util.hideHelpPopup();
                    return true;
                });



                $('.oauthButton').on('click',function(){
                    disableSignupButton();
                });

                $('#pageInputs').on('shown', function () {
                    $('.accordion-heading').css('background-color','#ffffff');
                    $('#birthDetailsHeading').css('background-color','#f5f5f5');

                });

                $('#toolsPageInputs').on('shown', function () {
                    $('.accordion-heading').css('background-color','#ffffff');
                    $('#compatibilityDetailsHeading').css('background-color','#f5f5f5');


                });

                $('#collapseSettings').on('shown', function () {
                    $('.accordion-heading').css('background-color','#ffffff');
                    $('#settingsDetailsHeading').css('background-color','#f5f5f5');

                });

            };




            function logoutUser(){

                window.location = '/logout/';

            }

            function disableSignupButton(){
                $('.oauthButton').button('loading');
                $scope.loggingIn = true;
                $scope.loggingInStyle = "{display:block;}";
                $scope.$apply();
                return true;
            }




            $scope.bindEvents();

        }]);

    });




