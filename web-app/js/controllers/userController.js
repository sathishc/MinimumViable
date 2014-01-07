define([
    'jquery',
    'knockout',
    'amplify',
    'common',
    'util',
    'userModel',
    'pageController',
    'bootstrap'
    ],
    function(
        $,ko,amplify,common,util,
        UserModel,PageController)
    {

    var userModel,pageModel;


    var self;


    return {


        init:function(){

            if(userModel == undefined)
            {
                var controllerName = 'Self';
                self = this;


                userModel = new UserModel();

                pageModel = PageController.init();

                userModel.bindEvents = function(){
                    self.bindEvents();
                }
            }

            return userModel;

        },

        bindEvents:function(){

            $('input.updateProfileSettingsButton').unbind();
            $('input.updateProfileSettingsButton').on('click',updateProfileSettings);

            $('input.updateNotificationSettingsButton').unbind();
            $('input.updateNotificationSettingsButton').on('click',updateNotificationSettings);

            amplify.request('isLoggedIn',function(response){
                console.log(response);
                if(response.status){
                    userModel.userName(response.userName);
                    userModel.md5Name(response.md5Name);
                    userModel.firstName(response.firstName);
                    userModel.lastName(response.lastName);
                    userModel.gender(response.gender);
                    userModel.generalDetails(response.generalDetails);
                    userModel.isPersonaSession(response.isPersonaSession);
                    userModel.selectedFeatureNotificationSetting(response.featureNotificationFrequency);
                }

            });

            return userModel;
        }
    };

    function updateProfileSettings(){
        $('input.updateProfileSettingsButton').button('loading');
        amplify.request('updateProfileSettings',userModel.profileformParameters(),function (data,textStatus){
            if(data.status){

                userModel.firstName(data.firstName);
                userModel.lastName(data.lastName);
                userModel.gender(data.gender);
                userModel.generalDetails(data.generalDetails);


                userModel.isProfileDirty(false);
            }
            $('input.updateProfileSettingsButton').button('reset');
        });
    }

    function updateNotificationSettings(){
        $('input.updateNotificationSettingsButton').button('loading');
        amplify.request('updateNotificationSettings',userModel.notificationformParameters(),function updateNotificationSettingsModel(data,textStatus){
            if(data.status){

                userModel.selectedFeatureNotificationSetting(data.featureNotificationFrequency);
                userModel.isNotificationDirty(false);

            }
            $('input.updateNotificationSettingsButton').button('reset');
        });
    }

});

