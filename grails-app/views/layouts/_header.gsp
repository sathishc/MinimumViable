<div class="well" style="background: none;color: orange;border: 0;margin-bottom: 0;margin-top: 0;padding: 0;">
    <h2 style="display: inline;font-size: 2em;"><a href="/" style="color: #f5deb3;">Minimum<span style="color: f5deb3;">Viable</span></a></h2>
    <span style="display: none;">
        <a href="#home" data-target="#home" data-toggle="tab" style="display: none;"></a>
        <a href="#compatibilityPage" data-target="#compatibilityPage" data-toggle="tab" style="display: none;">Compatibility</a>
        <a href="#errorPage" data-target="#errorPage" data-toggle="tab" style="display: none;">Error</a>
        <a href="#settingsPage" data-target="#settingsPage" data-toggle="tab" style="display: none;">Settings</a>
        <a href="#aboutPage" data-target="#aboutPage" data-toggle="tab" style="display: none;">About</a>


        <a href="#page2Content" data-target="#page2Content" data-toggle="tab" style="display: none;">page2Content</a>
        <a href="#toolsPageContent" data-target="#toolsPageContent" data-toggle="tab" style="display: none;">toolsPageContent</a>


        <a href="#page1Content" data-target="#page1Content" data-toggle="tab" style="display: none;">page1Content</a>
        <a href="#settingsOutput" data-target="#settingsOutput" data-toggle="tab" style="display: none;">Settings Output</a>
    </span>
    <span style="float: right;color: #000000;padding-top: 5px;">
        <span>
            <span class="dropdown">
              <sec:ifNotLoggedIn>
                  <a class="dropdown-toggle btn btn-link" data-toggle="dropdown" href="#" style="padding-right: 0;">
                      <span style="color:f5deb3;">
                          MVP Demo <i class="icon-lock"></i>
                      </span>
                  </a>
                  <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dLabel">

                      <li>
                          <oauth:connect
                                  class="oauthButton"
                                  provider="google"
                                  id="google-connect-header-link">
                              Join using Google
                          </oauth:connect>
                      </li>
                      <li>
                          <oauth:connect
                                  class="oauthButton"
                                  provider="facebook"
                                  id="facebook-connect-header-link">
                              Join using Facebook
                          </oauth:connect>
                      </li>
                      <li class="divider"></li>
                      <li><a href="/about">What is MVP?</a></li>
                      <li><a href="/terms">Terms of Service</a></li>
                      <li><a href="/privacy">Privacy</a></li>

                  </ul>
              </sec:ifNotLoggedIn>
              <sec:ifLoggedIn>
                  <a class="dropdown-toggle btn btn-link hidden"
                     id="headerControlId"
                     ng-controller="HeaderControl"
                     ng-class="{hidden:!isVisible()}"
                     data-toggle="dropdown"
                     href="#" style="color: orange;padding-right: 0;">
                      <span ng-bind="fullName()"></span>
                      <img ng-src="{{profilePicture()}}" title="{{fullName()}}"
                           alt="" style="height: 18px;"/>

                  </a>
                  <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dLabel">
                      <li><a href="/">Home</a></li>

                      <li class="divider"></li>
                      <li><a href="/about">What is MVP?</a></li>
                      <li><a href="/terms">Terms of Service</a></li>
                      <li><a href="/privacy">Privacy</a></li>
                      <li class="divider"></li>
                      <li>
                          <a href="#" id="logoutLink" >Logout</a>
                      </li>
                  </ul>
              </sec:ifLoggedIn>






                  |
            </span>
        </span>
    </span>
</div>


