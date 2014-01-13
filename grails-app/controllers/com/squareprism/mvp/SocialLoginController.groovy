package com.squareprism.mvp

import grails.converters.JSON
import org.scribe.model.Token
import org.scribe.model.Verifier
import uk.co.desirableobjects.oauth.scribe.OauthProvider
import uk.co.desirableobjects.oauth.scribe.OauthService
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import uk.co.desirableobjects.oauth.scribe.SupportedOauthVersion
import org.apache.commons.lang.RandomStringUtils
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.Authentication
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.authority.AuthorityUtils
import org.springframework.security.core.context.SecurityContextHolder
import groovyx.net.http.HTTPBuilder
import java.security.KeyStore
import org.apache.http.conn.scheme.Scheme
import org.apache.http.conn.ssl.SSLSocketFactory

import static groovyx.net.http.Method.POST
import org.apache.commons.validator.GenericValidator

class SocialLoginController {

    def userService
    def springSecurityService
    OauthService oauthService
    def emailService
    def rememberMeServices


    private final Token EMPTY_TOKEN = new Token('', '')

    private byte[] decodeBase64URL(data){
        return data.replaceAll(/\-/,'+').replaceAll(/\_/,'/').decodeBase64()
    }


    private def validateSigOAuth2AndSignIn(data, secret, encoded_sig) {

        byte[] decoded_data = decodeBase64URL(data)
        byte[] decoded_sig = decodeBase64URL(encoded_sig)
        String decoded_string = new String(decoded_data);
        def envelope = JSON.parse(decoded_string)

        return envelope
    }

    def callback = {

        String providerName = params.provider
        OauthProvider provider = oauthService.findProviderConfiguration(providerName)

        Verifier verifier = extractVerifier(provider, params)

        if (!verifier) {
            return redirect(uri: provider.failureUri)
        }

        Token requestToken = (Token) session[oauthService.findSessionKeyForRequestToken(providerName)]


        if (!requestToken) {
            //throw new MissingRequestTokenException(providerName)
            println "No request token, but it is ok for OAuth2"
            println "URI " + request.forwardURI
            println "Agent " + request.getHeader("User-Agent")
            println "Session Id " + request.getRequestedSessionId()
            println "Cookies " + request.getCookies()
        }

        Token accessToken = oauthService.getAccessToken(providerName, requestToken, verifier)

        session[oauthService.findSessionKeyForAccessToken(providerName)] = accessToken
        session.removeAttribute(oauthService.findSessionKeyForRequestToken(providerName))
        flash.isRedirected = true
        return redirect(uri: provider.successUri)

    }

    private Verifier extractVerifier(OauthProvider provider, GrailsParameterMap params) {

        String verifierKey = determineVerifierKey(provider)

        if (!params[verifierKey]) {
             log.error("Cannot authenticate with oauth: Could not find oauth verifier in ${params}.")
             return null
        }

        String verification = params[verifierKey]
        return new Verifier(verification)

    }

    private String determineVerifierKey(OauthProvider provider) {

        return SupportedOauthVersion.TWO == provider.oauthVersion ? 'code' : 'oauth_verifier'

    }

    def authenticate = {

        String providerName = params.provider
        OauthProvider provider = oauthService.findProviderConfiguration(providerName)

        Token requestToken = EMPTY_TOKEN
        if (provider.oauthVersion == SupportedOauthVersion.ONE) {
            requestToken = provider.service.requestToken
        }

        request.getSession(true)
        session.maxInactiveInterval = 60*30
        session[oauthService.findSessionKeyForRequestToken(providerName)] = requestToken
        String url = oauthService.getAuthorizationUrl(providerName, requestToken)

        return redirect(url: url)
    }


    def google = {

        if(flash.isRedirected != true){   // this is set by us in the application in the callback
            redirect(uri: "/")
            return
        }

        String providerName = 'google'
        String key = oauthService.findSessionKeyForAccessToken(providerName)
        def token = session[key]

        if(token == null){
            println "Could not get google access token in session " + session
            redirect(uri:"/")
            return
        }

        String access_token = token.getToken()
        org.scribe.model.Response infoResponse = oauthService.getGoogleResource(token, 'https://www.googleapis.com/oauth2/v1/userinfo')

        def body = infoResponse.getBody()
        def googleInfoResponse =  JSON.parse(body)

        String first_name = googleInfoResponse.given_name
        String last_name = googleInfoResponse.family_name
        String email = googleInfoResponse.email
        String providerUserId = googleInfoResponse.id

        handleSocialLogin(providerName,providerUserId,email,first_name,last_name,access_token)




        redirect(uri:"/")
    }

    def facebook = {

        if(flash.isRedirected != true){   // this is set by us in the application in the callback
            redirect(uri: "/")
            return
        }

        String providerName = 'facebook'
        String key = oauthService.findSessionKeyForAccessToken(providerName)
        def token = session[key]

        if(token == null){
            println "Could not get facebook access token in session " + session
            redirect(uri:"/")
            return
        }

        String access_token = token.getToken()
        org.scribe.model.Response response = oauthService.getFacebookResource(token, 'https://graph.facebook.com/me')

        def body = response.getBody()
        def fbResponse =  JSON.parse(body)

        //println(fbResponse)
        String first_name = fbResponse.first_name
        String last_name = fbResponse.last_name
        String email = fbResponse.email
        String providerUserId = fbResponse.id

        if(email == null || !email?.contains('@')){
            def model = [first_name: first_name,last_name: last_name,providerUserId:providerUserId,token:access_token]
            render(view: '/noEmailFromFacebook',model: model)
            return
        }
        else{
            handleSocialLogin(providerName,providerUserId,email,first_name,last_name,access_token)
            redirect(uri:"/")
        }
    }

    def persona = {

        def serverResponse = [status:true,message:'Already Logged in ']
        if(springSecurityService.isLoggedIn()){
            render serverResponse as JSON
            return
        }

        String providerName = 'persona'

        def audience = grailsApplication.config.grails.serverURL
        def assertion = params.assertion
        def personaResponse = ""
        def pathBase = 'https://verifier.login.persona.org'
        //def pathBase = 'https://api.parse.com'
        def pathUrl = '/verify' + '?assertion=' + assertion + '&audience=' + audience

        def url = pathBase + pathUrl
        def http = new HTTPBuilder( url )
        def keyStore = KeyStore.getInstance( KeyStore.defaultType )
        getClass().getResource( "/libsecuritycacerts" ).withInputStream {
            return keyStore.load( it, "changeme".toCharArray() )
        }


        http.client.connectionManager.schemeRegistry.register(new Scheme("https", new SSLSocketFactory(keyStore), 443) )


        // perform a POST request, expecting JSON response data
        http.request(POST, 'application/json' ) {
            // response handler for a success response code:
            response.success = { resp, json ->
                //println resp.statusLine
                personaResponse = json
            }

            // handler for any failure status code:
            response.failure = { resp ->
                println "Unexpected error: ${resp.statusLine.statusCode} : ${resp.statusLine.reasonPhrase}"
            }
        }

        println personaResponse
        serverResponse = [status:false,message:'Could not verify persona Login']
        if (personaResponse?.status != 'okay'){
            render serverResponse as JSON
            return
        }

        //println(fbResponse)
        String first_name = 'MVP'
        String last_name = "User"
        String email = personaResponse.email
        String providerUserId = personaResponse.email

        if(email == null || !email?.contains('@')){
            serverResponse = [status:false,message:'Could not find valid email']
            render serverResponse as JSON
            return
        }
        else{
            handleSocialLogin(providerName,providerUserId,email,first_name,last_name,"")
            session['loginProvider'] = 'persona'
            serverResponse = [status:true,message:'Validated successfully with persona',email:email]
            render serverResponse as JSON
        }
    }

    def failure = {
        println("Called socialLogin failure")
        redirect(uri:"/")
    }

    def loginNoEmail = {
        String first_name = params.firstName
        String last_name = params.lastName
        String email = params.email
        String providerUserId = params.id
        String access_token = params.token

        handleSocialLogin('facebook',providerUserId,email,first_name,last_name,access_token)
        redirect(uri:"/")
    }

    private void handleSocialLogin(String providerName, String providerUserId, String userEmail, String userFirstName, String userLastName, String currentAccessToken){
        def user =  userService.getMediaNearbyUserByProviderUserIdAndProvider(providerUserId,providerName)
        // if user already registered or new user successfully created authenticate with spring security
        if(user){

            Authentication authentication = new UsernamePasswordAuthenticationToken(user.username, user.password,
            AuthorityUtils.createAuthorityList("ROLE_USER"));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            springSecurityService.reauthenticate(user.username,user.password)
            rememberMeServices.onLoginSuccess(request,response,springSecurityService.authentication)
        }
        else{
            //check if the user has registered using the email provided
            user = userService.getAstroUserByEmailId(userEmail)
            if(user){
                Authentication authentication = new UsernamePasswordAuthenticationToken(user.username, user.password,
                AuthorityUtils.createAuthorityList("ROLE_USER"));
                SecurityContextHolder.getContext().setAuthentication(authentication);
                springSecurityService.reauthenticate(user.username,user.password)
                rememberMeServices.onLoginSuccess(request,response,springSecurityService.authentication)
                // this is used if a user logs in with persona and
                // a google or facebook name mismatches with the orignal first name
                updateUserFirstAndLastNames(user,userFirstName,userLastName,providerName)
                createNewConnectionIfUnavailable(user.username,providerName,providerUserId)
            }
            else{
                //if we cannot find a user from email and facebook Id, we will just register the new user
                if (userEmail && userFirstName && userLastName){
                    user = createNewUser(userFirstName,userLastName,userEmail)
                    if(user){

                        createNewConnectionIfUnavailable(user.username,providerName, providerUserId)
                        Authentication authentication = new UsernamePasswordAuthenticationToken(user.username, user.password,
                        AuthorityUtils.createAuthorityList("ROLE_USER"));
                        SecurityContextHolder.getContext().setAuthentication(authentication);
                        springSecurityService.reauthenticate(user.username,user.password)
                        rememberMeServices.onLoginSuccess(request,response,springSecurityService.authentication)

                        def receiverName = user.firstName + ' ' + user.lastName
                        def receiverEmail = user.username
                        emailService.sendWelcomeEmail(receiverEmail,receiverName)
                    }
                }
            }
        }

        // finally if a user was available, check and replace the access token if it is invalid
        if (user){
            def connection = UserConnection.findByProviderIdAndUserName(providerName,user.username)
            if (connection){

                String token = connection.accessToken
                if (currentAccessToken != token){
                    connection.accessToken = currentAccessToken
                    connection.save()
                }
            }
        }
    }

    private User createNewUser(firstName, lastName, email){
          long userId = System.currentTimeMillis()

          String charset = (('A'..'Z') + ('0'..'9')).join()
          Integer length = 9
          String randomString = RandomStringUtils.random(length, charset.toCharArray())

          def password = userId.toString() + email + randomString;

          def user = userService.createNewUser(
                  firstName,
                  lastName,
                  email,
                  password);
          return user
    }

    private UserConnection createNewConnectionIfUnavailable(String userName, String providerName, String providerUserId){
      def connection = UserConnection.findByUserNameAndProviderId(userName, providerName)
      if(connection){
            return connection
      }


      connection = UserConnection.create(userName, providerUserId,providerName,true)
      return connection
    }

    private updateUserFirstAndLastNames(def user, String userFirstName, String userLastName,String providerName){
        if (providerName == 'persona'){
            // dont replace anything if input is coming from persona
            return
        }
        if (user != null){
            if (user.firstName != userFirstName){
                user.firstName = userFirstName
            }

            if (user.lastName != userLastName){
                user.lastName = userLastName
            }

            user.save(flush:true)
        }
    }

    private updateUserProfileWithContactObjectId(def userName, def objectId){
        def currentUser = User.findByUsername(userName)
        currentUser.gmailContactObjectId = objectId;
        currentUser.save(flush: true)
    }

    private updateUserProfileWithFBContactObjectId(def userName, def objectId){
        def currentUser = User.findByUsername(userName)
        currentUser.facebookContactObjectId = objectId;
        currentUser.save(flush: true)
    }


}