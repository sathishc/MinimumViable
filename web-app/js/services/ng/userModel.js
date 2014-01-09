define(['angular'],function(angular){

    // define the service provider configuration here
    var userService = angular.module('userService',[]);

    userService.factory('user',['$rootScope','$http','$q',function($rootScope,$http,$q){
        var userDataLoaded = false;

        var userData = $q.defer();;
        return{
            getServerUserData:function(){

                if(!userDataLoaded){

                    $http.get('/user/isLoggedIn').then(function(response){

                        console.log(response);

                        setTimeout(function(){
                            $rootScope.$apply(function(){
                                userData.resolve(response.data);
                            });
                        },100);
                        userDataLoaded = true;

                    });

                }

                return userData.promise;

            },
            getUserData:function(){
                return userData.promise;
            },
            isUserDataLoaded:function(){
                return userDataLoaded;
            }
        };
    }]);

});

