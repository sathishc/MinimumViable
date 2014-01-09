%{--<style type="text/css">
.ng-hide {

    display:block!important;

//this is just another form of hiding an element
position:absolute;
    top:-9999px;
    left:-9999px;
}
</style>--}%

<div align="center">
    <div style="padding-bottom: 5px;" ng-hide="loggingIn">
        <div class="well-small">
            <oauth:connect class="oauthButton btn btn-danger btn-large span12"
                           data-loading-text="Signing In. Please wait.."
                           provider="google" id="google-connect-link">
                Google Login
            </oauth:connect>
        </div>
        <br/><br/>
        <div class="well-small">
            <oauth:connect class="oauthButton btn btn-info btn-large span12"
                           data-loading-text="Signing In. Please wait.."
                           provider="facebook" id="facebook-connect-link">
                Facebook Login
            </oauth:connect>
        </div>
        <br/><br/>
        <div class="well-small">
            <button id="personaLoginButton" class="btn btn-success btn-large span12">
                Email Login
            </button>
        </div>
    </div>
    <div align="center" class="hidden" ng-class="{hidden:!loggingIn}">
        <div style="margin:0;color: #808080;margin-bottom: 10px;">Signing in...</div>
        <div class="progress progress-striped active">
            <div class="bar" style="width: 100%;"></div>
        </div>
    </div>
    <br/><br/>
    <div class="well-small" align="center">
        <a href="/terms"
           style="color: grey;text-decoration: underline;padding-right: 5px;padding-left: 5px;">Terms of Service</a>
    </div>
    <div class="well-small" align="center">
        <a href="/privacy" style="color: grey;text-decoration: underline;padding-right: 5px;padding-left: 5px;">Privacy Policy</a>
    </div>
    <div class="well-small" align="center">
        <a href="#"
           rel="popover"
           data-html="true"
           data-trigger="click"
           data-placement="bottom"
           data-content="<span style='color:gray'>SquarePrism Software <br> ph +918042280562 </span> <br> <a href='mailto:support@squareprism.com'>support@squareprism.com</a> <br> <a href='http://www.squareprism.com'>www.squareprism.com</a>"
           data-original-title="<span style='color:black'>Contact Details</span>"
           style="color: grey;text-decoration: underline;padding-right: 5px;padding-left: 5px;"
        >
            Contact Details
        </a>
    </div>
</div>


