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
        "pageController":"controllers/ng/landingPageController",
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
    'pageController',
    'util',
    'bootstrap',
    'persona'
],function($,angular){


    require(['domReady'], function (domReady) {
        domReady(function (document) {



            var app = angular.module('mvApp',['pageController']);

            angular.bootstrap(document, ['mvApp']);

            $.ajaxSetup({statusCode:{401:function(){
                $('#sessionTimeoutDialog').modal('show');
            }}});

            $.ajaxSetup({statusCode:{401:function(){
                $('#sessionTimeoutDialog').modal('show');
            }}});

        });
    });

});