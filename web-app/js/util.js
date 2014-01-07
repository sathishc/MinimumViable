define(['jquery'],function($){

    return {

        parseTime:function(timeString) {
            if (timeString == '') return null;

            var time = timeString.match(/(\d+)(:(\d\d))?\s*(p?)/i);
            if (time == null) return null;

            var hours = parseInt(time[1],10);
            if (hours == 12 && !time[4]) {
                hours = 0;
            }
            else {
                hours += (hours < 12 && time[4])? 12 : 0;
            }
            var d = new Date();
            d.setHours(hours);
            d.setMinutes(parseInt(time[3],10) || 0);
            d.setSeconds(0, 0);
            return d;
        },

        getTimeFromHourMinutes:function(hours, minutes){

            var suffix = (hours >= 12)? 'PM' : 'AM';

            //only -12 from hours if it is greater than 12 (if not back at mid night)
            var  newhours = (hours > 12)? hours -12 : hours;

            //if 00 then it is 12 am
            newhours = (newhours == '00')? 12 : newhours;


            if(minutes <10){
                return newhours + ':0' + minutes + ' ' + suffix;
            }
            return newhours + ':' + minutes + ' ' + suffix;
        },

        getStartTime:function(){
            var today = new Date();
            var hours = today.getHours();
            var minutes = today.getMinutes();
            return this.getTimeFromHourMinutes(hours,minutes);
        },

        saveLatestProfile:function(profileId){
            if(localStorage){
                localStorage.setItem("latestProfile",profileId);
            }
        },

        popHelpDialog:function(){

            if(localStorage == undefined){
                // localstorage is not available in this browser
                return;
            }

            var dontShowHelper = localStorage.getItem('dontShowHelper');

            if(dontShowHelper == null || dontShowHelper == undefined || dontShowHelper == 'false'){
                $('#helpPopover').popover('show');
            }

        },

        hideHelpPopup:function(){

            //$('#helpPopover').popover('hide');
            localStorage.setItem('dontShowHelper',true);
        },

        showHelpPopup:function(){

            //$('#helpPopover').popover('show');
            localStorage.setItem('dontShowHelper',false);
        },



        IsEmail:function(email) {
            var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }

    }

});

