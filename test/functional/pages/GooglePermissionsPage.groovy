package pages

class GooglePermissionsPage extends ScaffoldPage {
    //static url = "https://accounts.google.com/"

    static at = {
        title == 'Request for Permission'
    }

    static content = {

        acceptPermissionsButton { $("button#submit_approve_access") }
    }
}

