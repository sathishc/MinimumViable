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
            <div align="center" data-bind="visible:loggingIn()==false">
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




<sec:ifLoggedIn>

<div id="sharedWithEmailDialog" class="modal hide fade in" data-backdrop="static" style="display: none; ">
    <div class="modal-header">
        <a href="#" class="close" data-dismiss="modal">x</a>
        <h5>Share with Email</h5>
    </div>
    <div class="modal-body">
        <div>
            We have sent you an email than you can forward to your friends. Please check your inbox.
        </div>
    </div>
</div>






<script type="text/html" id="briefcasePublicShareDialogTemplate">
    <div class="modal-header">
        <a href="#" class="close" data-dismiss="modal">x</a>
        <h5>Your chart is available at <a data-bind="text:activeShareURL,attr:{href:activeShareURL}"
                                          target='_blank'
                                          style="color: #00008b;text-decoration: underline;"></a>
        </h5>
    </div>
    <div class="modal-body">
        <div align="center">
            <span>
                <a href="#" class="btn btn-info"
                   onclick="
                       window.open(
                               'https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(activeShareURL()),
                               'facebook-share-dialog',
                               'width=626,height=436');
                       return false;">
                    Share on Facebook
                </a>

                <a class="btn btn-danger" class="btn btn-mini"
                   data-bind="attr:{href:'https://plus.google.com/share?url=' + activeShareURL()}"
                   onclick="javascript:window.open(this.href,
                           '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;">
                    Share on Google+
                </a>
            </span>
        </div>
    </div>
</script>





<div id="couldNotEmailDialog" class="modal hide fade in" data-backdrop="static" style="display: none; ">
    <div class="modal-header">
        <a href="#" class="close" data-dismiss="modal">x</a>
        <h5>Share with Email</h5>
    </div>
    <div class="modal-body">
        <div>
            We have sent you an email than you can forward to your friends
        </div>
    </div>
</div>

</sec:ifLoggedIn>

<script type="text/html" id="fromNameTemplate">
    <span class="span1"> From:</span>
    <input data-bind="value:userName" type="text" disabled="true"/>
</script>

<script type="text/html" id="mailSubjectTemplate">
    <span class="span1">Subject: </span>Horoscope from
    <span data-bind="text:whosJatakam"></span>
</script>