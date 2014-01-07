requirejs.config({
    "baseUrl": "js",
    "paths": {
        "jquery": "thirdparty/jquery-latest",
        "knockout": "thirdparty/knockout-latest",
        "amplify": "thirdparty/amplify.min",
        "twitter-bootstrap": "thirdparty/bootstrap.min",
        "knockout-local-storage": "thirdparty/knockout-local-storage",
        "knockout-mapping": "thirdparty/knockout-mapping-latest",
        "knockout-amd-helpers": "thirdparty/knockout-amd-helpers.min",
        "path": "thirdparty/path.min",
        "domReady":"domReady",
        "util":"util",
        "pageModel":"viewmodels/page",
        "pageController":"controllers/pageController",
        "persona":"//login.persona.org/include"
    },
    "shim":{
        "twitter-bootstrap":{
            deps:['jquery']
        },
        "amplify": {
            deps: ["jquery"],
            exports: "amplify"
        },
        d3: {
            exports: 'd3'
        }
    },
    waitSeconds: 30
});

require([
    'jquery',
    'knockout',
    'pageModel',
    'pageController',
    'routes',
    'requests',
    'common',
    'util',
    'routes',
    'requests',
    'common',
    'path',
    'twitter-bootstrap',
    'knockout-amd-helpers',
    'persona'
],function($,ko,
           PageModel,
           pageController,
           routes,requests){


    require(['domReady'], function (domReady) {
        domReady(function () {
            routes.init();

            //setup amplify request handlers
            requests.init();

            //initialize page controller
            pageController.init();



            $.ajaxSetup({statusCode:{401:function(){
                $('#sessionTimeoutDialog').modal('show');
            }}});

            $.ajaxSetup({statusCode:{401:function(){
                $('#sessionTimeoutDialog').modal('show');
            }}});

            ko.applyBindings({});

            setTimeout(function(){
                pageController.bindEvents(null);
            },1000);

        });
    });

    ko.bindingHandlers.module.initializer = "init";

});