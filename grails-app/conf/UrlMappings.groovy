class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"{
            controller = "siteMap"
            action = "home"
            alternativeHome = {session.source == 'alt'}
        }


        "/page1"(view: "/pages/page1")
        "/tools"(view: "/pages/tools")
        "/page2"(view: "/pages/page2")
        "/settings"(view: "/pages/settings")



        "/alt"{
            controller = "siteMap"
            action = "altHome"
        }


        "/terms"(view:"/termsIndex")
        "/privacy"(view:"/privacyIndex")
        "/about"(view:"/aboutIndex")



        "/login/$action"(view:"/index")



		"500"(view:'/error')
        "404"(view:'/index')
        "/robots.txt"(view:'/robots')
        "/sitemap"(controller: 'siteMap',action: 'sitemap')

        //over riding the default call back method in OauthController
        "/oauth/$provider/callback"(controller: 'socialLogin', action: 'callback')
        "/oauth/$provider/authenticate/"(controller: 'socialLogin', action: 'authenticate')
        "/oauth/$provider/authenticate/$source"{
            controller = 'socialLogin'
            action = 'authenticate'
        }
	}
}
