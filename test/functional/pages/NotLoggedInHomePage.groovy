package pages

import geb.Module

class NotLoggedInHomePage extends ScaffoldPage {
    static url = "/"

    static at = {
        title == 'Indian Horoscope Matching & Daily Predictions. Vedic Astrology for All. Fun, Free and Simple'
    }

    static content = {

        header { $("h1.well-small").text() }
        googleSignInButton{ $("a.oauthButton", text: "Join using Google") }
    }
}

