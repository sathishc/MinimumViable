package com.squareprism.mvp

class UserConnection{

    String userName
    String providerId
    String providerUserId
    String accessToken


    static constraints = {
        userName nullable: false
        providerId nullable: false, inList: ['facebook','twitter','linkedin','google','foursquare','yahoo','live','persona']
        providerUserId nullable: false
        accessToken nullable: true
    }

    static mapping = {
        table "UserConnection"
        version false


        userName column:'userName', index: 'userName_Idx'
        providerId column:'providerId', index: 'providerId_Idx'
        providerUserId column:'providerUserId'
        accessToken column: 'accessToken'
    }

    static UserConnection create(String userId, String providerUserId, String providerId, boolean flush=false){
       new UserConnection(userName: userId, providerUserId: providerUserId, providerId: providerId).save(flush: flush, insert: true, failOnError: true)
    }

    static boolean remove(String userName, String providerId, boolean flush=false){
       UserConnection instance = UserConnection.findByUserNameAndProviderId(userName, providerId)
       instance ? instance.delete(flush: flush) : false
    }

}
