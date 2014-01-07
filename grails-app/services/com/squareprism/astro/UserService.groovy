package com.squareprism.astro

class UserService {

    static transactional = false

    def springSecurityService

    def getAstroUserByGoogleId(String id) {
       def connection = UserConnection.findByProviderIdAndProviderUserId('google',id)
       def user = null
       if(connection){

           user = User.findByUsername(connection.userName)
       }
       return user
    }

    def getAstroUserByEmailId(String emailId) {
       return User.findByUsername(emailId)
    }



    def getMediaNearbyUserByProviderUserIdAndProvider(String id, String provider) {
       def connection = UserConnection.findByProviderIdAndProviderUserId(provider,id)
       def user = null
       if(connection){

           user = User.findByUsername(connection.userName)
       }
       return user
    }

    def createNewUser(String firstName, String lastName, String email, String userPassword){

      def user = User.findByUsername(email)
      if( user == null){
        String password = null

        // username = email = salt source property
        if(userPassword == "" || userPassword == null){
            password = springSecurityService.encodePassword(user.id + email,email)
        }
        else{
            password = springSecurityService.encodePassword(userPassword,email)
        }

        def roleUser = getUserRole()


        user = new User(firstName: firstName,lastName: lastName, username:email, password:password, enabled:true)
        user.save(flush:true)

        UserRole.create(user, roleUser, true)
      }
      return user
    }

    def getUserRole(){
        def roleUser = Role.get(1);
        if(roleUser == null){
          roleUser = new Role(id:1, authority: 'ROLE_USER').save(flush: true)
        }
        return roleUser
    }
}
