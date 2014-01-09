<div data-bind="module:{name:'pageController',template:'sessionTimeoutDialogTemplate'}"></div>


<script type="text/html" id="sessionTimeoutDialogTemplate">
    <div id="sessionTimeoutDialog" class="modal hide fade in" data-backdrop="static" style="display: none; ">
        <div class="modal-header">
            <a href="#" class="close" data-dismiss="modal">x</a>
            <h5>Session Timed out</h5>
        </div>
        <div class="modal-body">
            <div>
                Your session has timed out. Please login again to use MVP
            </div>
        </div>
        <div align="center" id="loginDialogFooter" class="modal-footer" style="background-color: red;">
            <div align="center"
                 data-bind="visible:loggingIn()==false">
                <oauth:connect
                        class="oauthButton btn btn-mini btn-inverse"
                        provider="google"
                        data-loading-text="Signing in.."
                        id="google-connect-link">
                    Sign in with Google
                </oauth:connect>
                <oauth:connect
                        class="oauthButton btn btn-mini btn-info"
                        provider="facebook"
                        data-loading-text="Signing in.."
                        id="google-connect-link">
                    Sign in with Facebook
                </oauth:connect>
            </div>
            <div align="center" data-bind="visible:loggingIn()">
                <button class="btn btn-mini">Signing in..</button>
            </div>
        </div>
    </div>
</script>



