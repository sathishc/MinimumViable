package pages

class GoogleAccountsPage extends ScaffoldPage {
    //static url = "https://accounts.google.com/"

    static at = {
        title.contains('Google Accounts')
    }

    static content = {
        emailTextfield { $("input#Email") }
        passwordTextfield { $("input#Passwd") }
        signInButton { $("input#signIn") }
    }
}

