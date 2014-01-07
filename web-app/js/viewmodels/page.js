define(['jquery','knockout'], function($,ko) {
    return function() {
        var self = this;
        self.profileLoaded = ko.observable(false);
        self.url = ko.observable("home");
        self.loggingIn = ko.observable(false);
        self.selectedPage = ko.observable('Page1');
        self.isPage1Selected = ko.computed(function(){
            return self.selectedPage() == 'Page1';
        });
        self.isPersonaSession = ko.observable(false);
    }
});
