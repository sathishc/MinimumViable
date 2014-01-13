package com.squareprism.mvp

import grails.plugins.springsecurity.Secured
import grails.converters.JSON

class UserController {

    def springSecurityService
    def emailService

    def isLoggedIn() {
        def response = [status: false,message: "Not logged in"]
        if(springSecurityService.isLoggedIn()){
            def currentUser = User.get(springSecurityService.principal.id)

            if (currentUser.md5UserName == null){
                currentUser.md5UserName = currentUser.username.encodeAsMD5()
                currentUser.save(flush: true)
            }

            def fullName = currentUser.firstName.capitalize() + ' ' + currentUser.lastName.capitalize()
            def userName = currentUser.username
            def md5UserName = currentUser.md5UserName

            // find out if the session is created though persona
            def isPersonaSession = false
            if (session['loginProvider'] == 'persona'){
                isPersonaSession = true
            }



            response = [
                    status: true,
                    message: "User logged in",
                    userName:userName,
                    md5Name:md5UserName,
                    name: fullName,
                    firstName: currentUser.firstName.capitalize(),
                    lastName: currentUser.lastName.capitalize(),
                    gender: currentUser.gender,
                    generalDetails: currentUser.generalDetails,
                    featureNotificationFrequency: currentUser.featureNotificationFrequency,
                    isPersonaSession:isPersonaSession]
        }
        render response as JSON
    }

    @Secured(['ROLE_USER'])
    def updateUserProfile(String firstName, String lastName, String gender, String generalDetails,String astrologer) {
        def response = [status: false,message: "Could not update profile"]
        if(!springSecurityService.isLoggedIn()){
            render response as JSON
            return
        }

        def currentUser = User.get(springSecurityService.principal.id)

        if (currentUser == null){
            response = [status: false,message: "Could not find user"]
            render response as JSON
            return
        }

        if(firstName){
            currentUser.firstName = firstName;
        }

        if(lastName){
            currentUser.lastName = lastName;
        }





        if(gender){
            currentUser.gender = gender;
        }

        if(generalDetails){
            if (generalDetails.length() <= 140){
                currentUser.generalDetails = generalDetails;
            }
        }else
        {
            currentUser.generalDetails = "";
        }



        currentUser.save(flush: true)


        response = [
                status: true,
                message: "Profile details saved",
                firstName: currentUser.firstName,
                lastName: currentUser.lastName,
                gender: currentUser?.gender,
                generalDetails: currentUser.generalDetails
        ]
        render response as JSON
    }

    @Secured(['ROLE_USER'])
    def updateNotificationSettings(
            String predictionNotification,
            String featureNotification) {
        def response = [status: false,message: "Could not update settings"]
        if(!springSecurityService.isLoggedIn()){
            render response as JSON
            return
        }

        def currentUser = User.get(springSecurityService.principal.id)

        if (currentUser == null){
            response = [status: false,message: "Could not find user"]
            render response as JSON
            return
        }



        if(featureNotification){
            currentUser.featureNotificationFrequency = Integer.parseInt(params.featureNotification)
        }

        currentUser.save(flush: true)
        response = [
                status: true,
                message: "Settings details saved",
                featureNotificationFrequency:currentUser.featureNotificationFrequency
        ]
        render response as JSON
    }


    @Secured(['ROLE_USER'])
    def searchUsers() {
        def query = params.query + "%"
        def currentUser = User.get(springSecurityService.principal.id)

        def users = User.findAllByFirstNameLikeAndIdNotEqual(query,currentUser.id,[max:10,sort:'firstName'])
        def response = users.collect{['value':it.firstName + ' ' + it.lastName,'hash':it.md5UserName]}
        render response as JSON
    }

}
