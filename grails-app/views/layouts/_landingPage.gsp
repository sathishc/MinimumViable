<div class="row-fluid">

    <sec:ifNotLoggedIn>

        %{--Landing Page Content before sign in--}%
        <div id="beforeSignupLandingPage"
             align="center"
             data-bind="module:'pageController'"
             ng-controller="PageControl">
            <div class="span9">
                <div class="well-small" style="background-color: #000000;border-color: #708090">
                    <g:render template="/landing/beforeSignupContent" />
                </div>
            </div>
            <div class="span3">
                <div class="well-small visible-desktop" style="background-color: #000000;height: 580px;border-color: #708090">
                    <g:render template="/landing/beforeSignupInputs" />
                </div>
            </div>
        </div>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>

    %{--Landing Page Content after sign in--}%

        <div id="afterSignupLandingPage"
            data-bind="module:{name:'pageController'}"
            ng-controller="PageControl"
            xmlns="http://www.w3.org/1999/html">
            <div align="center"
                data-bind="visible:profileLoaded()==false"
                ng-show="!profileLoaded()"
                class="well offset4 span4">
                <div align="center">Please wait..</div>
                <div align="center" class="progress progress-striped active">
                    <div class="bar" style="width: 100%;"></div>
                </div>
            </div>
            <div
                data-bind="css:{hidden:profileLoaded()==false}"
                ng-class="{hidden:profileLoaded()==false}"
                class="hidden">

                <div
                    class="span8"
                    id="chartContainer"
                    style="background-color: white;border-color: #e3e3e3;border-style: solid;border-width: 1px;height: 620px;">

                        <g:render template="/landing/afterSignedUpContent" />
                </div>

                <div
                    class="span4"
                    id="inputContainer"
                    style="background-color: white;border-color: #e3e3e3;border-style: solid;border-width: 1px;height: 620px;">

                        <g:render template="/landing/afterSignedUpInputs" />

                </div>
            </div>


    </sec:ifLoggedIn>
</div>

