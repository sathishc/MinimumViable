<div class="row-fluid">

    <sec:ifNotLoggedIn>

        %{--Landing Page Content before sign in--}%

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
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>

    %{--Landing Page Content after sign in--}%

        <div data-bind="module:{name:'pageController'}" xmlns="http://www.w3.org/1999/html">
            <div align="center" class="well offset4 span4" data-bind="visible:profileLoaded()==false">
                <div align="center">Please wait..</div>
                <div align="center" class="progress progress-striped active">
                    <div class="bar" style="width: 100%;"></div>
                </div>
            </div>
            <div data-bind="visible:profileLoaded()==true" style="display: none">

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

