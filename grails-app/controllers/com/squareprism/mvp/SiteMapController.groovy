package com.squareprism.mvp
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import org.springframework.web.servlet.ModelAndView
import grails.util.Environment

class SiteMapController {

    def springSecurityService
    def router = {

        def displayView = "/index"
        def route = request.getForwardURI()
        def title = "Vedic Astrology for All - Fun, Free and Simple"
        def parts = route.split('/')

        if(route.contains('compatibility')){
            def md5Name = parts[2]
            def currentUser = User.findByMd5UserName(md5Name)
            if (currentUser){
                def fullName = currentUser?.firstName + ' ' + currentUser?.lastName
                title = "Check your compatibility with " + fullName
            }else{
                title = "Check your compatibility"
            }
        }else if(route.contains('horoscope')){
            def md5Name = parts[2]
            def currentUser = User.findByMd5UserName(md5Name)
            if (currentUser){
                def fullName = currentUser?.firstName + ' ' + currentUser?.lastName
                title = "View " + fullName + "'s horocope"
            }else{
                title = "View horoscope"
            }
        }

        return new ModelAndView(displayView,[url:"router",route:route,title:title])
    }

    def home(){
        def homePage = "/index"
        if (params.alternativeHome == 'true'){
            homePage = "/indexAlt"
        }
        render(view: homePage)
    }

    def test(){
        def environmentName = Environment.current.name
        if (environmentName != 'prod'){
            def currentUser = User.findByUsername('support@squareprism.com')
            springSecurityService.reauthenticate(currentUser.username,currentUser.password)
            def homePage = "/index"
            render(view: homePage)
        }else{
            render "Cannot execute in production"
        }

    }



    def altHome(){
        def homePage = "/indexAlt"
        session['source'] = "alt"
        render(view: homePage)

    }

    def sitemap = {
       render(contentType: 'text/xml', encoding: 'UTF-8') {
           mkp.yieldUnescaped '<?xml version="1.0" encoding="UTF-8"?>'
           urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
                   'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
                   'xsi:schemaLocation': "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd")
           {
               url {
                   loc(CH.config.grails.serverURL)
                   changefreq('weekly')
                   priority(1.0)
               }

               /*url {
                   loc(CH.config.grails.serverURL + '/about')
                   changefreq('weekly')
                   priority(0.9)
               }*/



               url {
                   loc(CH.config.grails.serverURL + '/birthchart')
                   changefreq('weekly')
                   priority(0.8)
               }

               url {
                   loc(CH.config.grails.serverURL + '/predictions')
                   changefreq('weekly')
                   priority(0.8)
               }

               url {
                   loc(CH.config.grails.serverURL + '/match')
                   changefreq('weekly')
                   priority(0.8)
               }

               /*url {
                   loc(CH.config.grails.serverURL + '/faq')
                   changefreq('weekly')
                   priority(0.7)
               }*/

               /*url {
                   loc(CH.config.grails.serverURL + '/faq')
                   changefreq('weekly')
                   priority(0.2)
               }*/

               //add some dynamic entries
               /*User.list([max:10000, sort:'id', order: 'desc']).each {domain->
                   url {
                       loc(CH.config.grails.serverURL + '/horoscope/' + domain.md5UserName)
                       changefreq('weekly')
                       priority(0.8)
                   }
               }*/
           }
       }
    }
}
