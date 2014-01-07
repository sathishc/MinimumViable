package com.squareprism.astro

import groovyx.net.http.AsyncHTTPBuilder

class EmailService {

    static transactional = false

    def http = new AsyncHTTPBuilder(poolSize:25,uri:'https://mandrillapp.com/api/1.0/messages/send-template.json?key=YOUR_MANDRILL_KEY')

    /* Change this to customize your welcome emails */

    def sendWelcomeEmail(def receiverEmail, def receiverName) {
        def mandrillKey = 'YOUR_MANDRILL_KEY'
        def mandrill_message = [:]
        mandrill_message.subject = "Welcome to MVP"
        mandrill_message.from_email = "mvp@minimumviable.in"
        mandrill_message.to = [[email:receiverEmail]]
        mandrill_message.global_merge_vars = [
                ['name':'USERNAME','content':receiverName],
        ]

        def mandrill_template_content = [['name':'','content':'']]

        def mandrillBody = [
            key:mandrillKey,
            message:mandrill_message,
            template_name:'MVP Welcome',
            template_content:mandrill_template_content
        ]

        def httpResponse = http.request(groovyx.net.http.Method.POST,groovyx.net.http.ContentType.JSON){ req -> body = mandrillBody
        }

        //println httpResponse

        http.handler.failure = { resp ->
         println "Unexpected failure: ${resp.statusLine}"
       }

        http.handler.success = { resp ->
         //println "success " + resp
       }
    }

}
