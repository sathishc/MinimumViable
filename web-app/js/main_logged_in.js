requirejs.config({
    "baseUrl": "js",
    "paths": {
        "jquery": "thirdparty/jquery-latest",
        "angular": "thirdparty/ng/angular.min",
        "angular-route": "thirdparty/ng/angular-route.min",
        "angular-loader": "thirdparty/ng/angular-loader.min",
        "angular-resource": "thirdparty/ng/angular-resource.min",
        "bootstrap": "thirdparty/bootstrap.min",
        "domReady":"domReady",
        "util":"util",
        "routes":"routes/ng/routes",
        "requests":"services/ng/requests",
        "pageController":"controllers/ng/pageController",
        "userController":"controllers/ng/userController",
        "headerController":"controllers/ng/headerController",
        "userService":"services/ng/userModel",
        "persona":"//login.persona.org/include"
    },
    "shim":{
        "bootstrap":{
            deps:['jquery']
        },
        'angular': {
            exports: 'angular'
        },
        'angular-route': {
            exports: 'angular'
        },
        'angular-loader': {
            exports: 'angular'
        },
        'angular-resource': {
            exports: 'angular'
        }
    },
    waitSeconds: 30
});

require([
    'jquery',
    'angular',
    'util',
    'pageController',
    'userController',
    'headerController',
    'userService',
    'routes',
    'requests',
    'bootstrap',
    'persona'
],function($,angular,util,pageController,headerController){


    require(['domReady'], function (domReady) {
        domReady(function (document) {



            var app = angular.module('mvApp',['pageController','userController','headerController','userService','routes','requests']);





            $.ajaxSetup({statusCode:{401:function(){
                $('#sessionTimeoutDialog').modal('show');
            }}});

            $.ajaxSetup({statusCode:{401:function(){
                $('#sessionTimeoutDialog').modal('show');
            }}});

            util.popHelpDialog();


            angular.bootstrap(document, ['mvApp']);

        });
    });

});