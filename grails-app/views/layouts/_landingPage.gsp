<div class="row-fluid">

    <sec:ifNotLoggedIn>
        <a href="https://github.com/sathishc/MinimumViable"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/652c5b9acfaddf3a9c326fa6bde407b87f7be0f4/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6f72616e67655f6666373630302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_orange_ff7600.png"></a>
        %{--Landing Page Content before sign in--}%
        <div id="beforeSignupLandingPage"
             align="center"
             ng-controller="LandingPageControl">
            <div class="span9">
                <div class="well-small" style="background-color: #f5f5f5;height: 580px;border-color: #708090">
                    <g:render template="/landing/beforeSignupContent" />
                </div>
            </div>
            <div class="span3">
                <div class="well-small visible-desktop" style="background-color: #f5f5f5;height: 580px;border-color: #708090">
                    <g:render template="/landing/beforeSignupInputs" />
                </div>
            </div>
        </div>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>

    %{--Landing Page Content after sign in--}%

        <div id="afterSignupLandingPage"
            ng-controller="PageControl"
            xmlns="http://www.w3.org/1999/html">
            <div align="center"
                ng-show="!profileLoaded()"
                class="well offset4 span4">
                <div align="center">Please wait..</div>
                <div align="center" class="progress progress-striped active">
                    <div class="bar" style="width: 100%;"></div>
                </div>
            </div>
            <div  ng-class="{hidden:profileLoaded()==false}" class="hidden">
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

