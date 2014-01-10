define([
    'jquery','angular','util'],
    function($,angular,util){

        'use strict';

        /* Controllers */

        var pageController =  angular.module('pageController', []);


        pageController.controller('LandingPageControl',
            ['$scope',
                function ($scope) {


            $scope.url = "home";
            $scope.loggingIn = false;
            $scope.loggingInStyle = "{display:none;}";

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





                $('.popupHelpCloseButton').on('click',function(){
                    util.hideHelpPopup();
                    return true;
                });



                $('.oauthButton').on('click',function(){
                    disableSignupButton();
                });
            };


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




