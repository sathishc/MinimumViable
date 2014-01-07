define(['knockout','common'], function(ko,common) {


    return function(){

        var self = this;

        self.isDirty = ko.observable(false);
        self.userName = ko.observable();
        self.md5Name = ko.observable('none');
        self.image = ko.observable();

        self.selectedPredictionNotificationSetting = ko.observable(0);
        self.selectedFeatureNotificationSetting = ko.observable(0);
        self.isNotificationDirty = ko.observable(false);

        self.firstName = ko.observable("");
        self.lastName = ko.observable("");

        self.genderOptions = ko.observableArray(['Male','Female']);
        self.gender = ko.observable();
        self.generalDetails = ko.observable();
        self.isProfileDirty = ko.observable(false);

        self.isPersonaSession = ko.observable();


        self.fullName = ko.computed(function() {
            return self.firstName() + ' ' + self.lastName();
        });

        self.profilePicture = ko.computed(function() {
            return 'https://secure.gravatar.com/avatar/' + self.md5Name() + '?r=g&s=24&d=mm';
        });

        self.profilePictureForSettings = ko.computed(function() {
            return 'https://secure.gravatar.com/avatar/' + self.md5Name() + '?r=g&s=24&d=mm';
        });

        self.selectedPredictionNotificationSetting.subscribe(function(){
            self.isNotificationDirty(true);
        });

        self.selectedFeatureNotificationSetting.subscribe(function(){
            self.isNotificationDirty(true);
        });

        self.firstName.subscribe(function(){
            self.isProfileDirty(true);
        });

        self.lastName.subscribe(function(){
            self.isProfileDirty(true);
        });


        self.generalDetails.subscribe(function(){
            self.isProfileDirty(true);
        });

        self.gender.subscribe(function(){
            self.isProfileDirty(true);
        });

        self.profileformParameters = ko.computed(function(){
            return {
                firstName:self.firstName(),
                lastName:self.lastName(),
                gender:self.gender(),
                generalDetails:self.generalDetails()
            };
        });

        self.notificationformParameters = ko.computed(function(){
            return {
                featureNotification:self.selectedFeatureNotificationSetting()
            };
        });

    };

});



