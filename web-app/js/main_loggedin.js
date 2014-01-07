requirejs.config({
    "baseUrl": "js",
    "paths": {
        "jquery": "thirdparty/jquery-latest",
        "knockout": "thirdparty/ko/knockout-latest",
        "amplify": "thirdparty/ko/amplify.min",
        "bootstrap": "thirdparty/bootstrap.min",
        "knockout-local-storage": "thirdparty/ko/knockout-local-storage",
        "knockout-mapping": "thirdparty/ko/knockout-mapping-latest",
        "knockout-amd-helpers":"thirdparty/ko/knockout-amd-helpers.min",
        "path": "thirdparty/ko/path.min",
        "domReady":"domReady",
        "util":"util",
        "common":"common",
        "userModel":"viewmodels/user",
        "pageModel":"viewmodels/page",
        "userController":"controllers/ko/userController",
        "pageController":"controllers/ko/pageController",
        "persona":"//login.persona.org/include"
    },
    "shim":{
        'jquery': {
            exports: '$'
        },

        "bootstrap":{
            deps:['jquery'],
            exports: "$.fn.collapse"
        },

        "amplify": {
            deps: ["jquery"],
            exports: "amplify"
        }
    },
    waitSeconds: 60

});

require([
    'jquery',
    'knockout',
    'util',
    'routes',
    'requests',
    'knockout-amd-helpers','knockout-local-storage','path','bootstrap','persona','knockout-mapping'
],function($,ko,util,routes,requests){



    //setup amplify request handlers
    requests.init();
    routes.init();

    require(['domReady!'], function (doc) {

            require([
                'pageController',
                'userController'

            ],function(PageController,UserController){

                //initialize page controller
                PageController.init();
                var userModel = UserController.init();



                ko.applyBindings({});

                setTimeout(function(){
                    PageController.bindEvents("Guest");
                    UserController.bindEvents();
                },500);



            });

            util.popHelpDialog();

    });


    ko.bindingHandlers.module.initializer = "init";


});