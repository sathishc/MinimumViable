define([
    'jquery','knockout','amplify',
    'pageModel','util'],
    function($,ko,amplify,
             PageModel,util){

        var pageModel;

        return {
            init:function(){
                if(pageModel == undefined){
                    pageModel = new PageModel();

                    pageModel.selectedPage.subscribe(function(newValue){
                        if(newValue == 'Page1'){
                            if($("#page2Content").is('.active') == true){
                                showPage1();
                            }

                        }else{
                            if($("#page1Content").is('.active') == true){
                                showPage2();
                            }
                        }
                    });


                    amplify.subscribe('analyticsEvent',function(event){
                        _gaq.push(['_trackEvent',
                            event.category,                 // This custom var is set to slot #1.  Required parameter.
                            event.action,        // The name of the custom variable.  Required parameter.
                            event.label                     // Sets the value of "User Id" to the md5 name.
                        ]);
                    });

                    amplify.subscribe('analyticsTrackUsers',function(userName){
                        _gaq.push(['_setCustomVar',
                            1,                 // This custom var is set to slot #1.  Required parameter.
                            'User Id',         // The name of the custom variable.  Required parameter.
                            userName,  // Sets the value of "User Id" to the md5 name.
                            1                  // Sets the scope to visitor-level.  Optional parameter.
                        ]);
                    });

                    pageModel.profileLoaded(true);

                }

                return pageModel;
            },
            bindEvents:function(useremail){
                var loggedInUser = null;
                if(pageModel.isPersonaSession()){
                    loggedInUser = useremail
                }


                navigator.id.watch({
                    loggedInUser: loggedInUser,
                    onlogin: function(assertion) {
                        // A user has logged in! Here you need to:
                        // 1. Send the assertion to your backend for verification and to create a session.
                        // 2. Update your UI.
                        disableSignupButton();
                        $.ajax({ /* <-- This example uses jQuery, but you can use whatever you'd like */
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
                        if(pageModel.isPersonaSession() && loggedInUser){
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
                    if(pageModel.isPersonaSession()){
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
                    if(pageModel.selectedPage() == 'Page1'){
                        showPage1();
                    }else{
                        showPage2();
                    }
                });

                $('#toolsPageInputs').on('shown', function () {
                    $('.accordion-heading').css('background-color','#ffffff');
                    $('#compatibilityDetailsHeading').css('background-color','#f5f5f5');
                    showToolsPage();

                });


                $('#collapseSettings').on('shown', function () {
                    $('.accordion-heading').css('background-color','#ffffff');
                    $('#settingsDetailsHeading').css('background-color','#f5f5f5');
                    // do something…
                    if($("#settingsOutput").is('.active') == false){
                        $('a[href="#settingsOutput"]').tab('show');
                    }
                });

                return pageModel;

            },
            loadRoute:function(url){
                var userId;
                var urlParts = url.split('/');
                var pathUrl = '/' + urlParts[1];

                pageModel.url(pathUrl);
                Path.history.pushState({}, "", url);
            },
            setPage:function(page){
                pageModel.url(page);
            },
            profileLoaded:function(loaded){
                pageModel.profileLoaded(loaded);
            }
        };

        function logoutUser(){

            window.location = '/logout/';

        }

        function disableSignupButton(){
            $('.oauthButton').button('loading');
            pageModel.loggingIn(true);
            return true;
        }

        function showPage1(){
            // show the output tab if it not already shown
            if($("#page1Content").is('.active') == false){
                $('a[href="#page1Content"]').tab('show');
            }

        }

        function showPage2(){
            //compatibilityModel.chartCategoryType('Natal Chart');
            if($('#page2Content').is('.active') == false){
                $('a[href="#page2Content"]').tab('show');
            }
        }

        function showToolsPage(){
            if($('#toolsPageContent').is('.active') == false){
                $('a[href="#toolsPageContent"]').tab('show');
            }
        }

});



