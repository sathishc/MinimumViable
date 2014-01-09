define(['amplify'],function(amplify){
    return {

        /*
            Define all your http/ajax request to the server.
            These are invoked from within a controller using amplify.request
         */

        init:function(){

            amplify.request.define('isLoggedIn','ajax',{
                url:'/user/isLoggedIn',
                dataType:'json',
                type:'GET'
            });

            amplify.request.define('updateNotificationSettings','ajax',{
                url:'/user/updateNotificationSettings',
                dataType:'json',
                type:'POST'
            });

            amplify.request.define('updateProfileSettings','ajax',{
                url:'/user/updateUserProfile',
                dataType:'json',
                type:'POST'
            });

        }
    }

});

