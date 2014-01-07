requirejs.config({
    "baseUrl": "js",
    "paths": {
        "jquery": "thirdparty/jquery-latest",
        "knockout": "thirdparty/knockout-latest",
        "amplify": "thirdparty/amplify.min",
        "bootstrap": "thirdparty/bootstrap.min",
        "knockout-local-storage": "thirdparty/knockout-local-storage",
        "knockout-mapping": "thirdparty/knockout-mapping-latest",
        "knockout-amd-helpers":"thirdparty/knockout-amd-helpers.min",
        "path": "thirdparty/path.min",
        "domReady":"domReady",
        "util":"util",
        "common":"common",
        "userModel":"viewmodels/user",
        "pageModel":"viewmodels/page",
        "userController":"controllers/userController",
        "pageController":"controllers/pageController",
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