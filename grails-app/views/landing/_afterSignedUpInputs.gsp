<div xmlns="http://www.w3.org/1999/html">
    <div ng-hide="profileLoaded()">
        <div align="center" class="progress progress-striped active">
            <div class="bar" style="width: 100%;"></div>
        </div>
    </div>
    <div class="hidden" ng-class="{hidden:profileLoaded()==false}">
        <div class="accordion" id="accordion2">
            <div class="accordion-group">
                <div id="birthDetailsHeading" class="accordion-heading" style="background-color: #f5f5f5;">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#pageInputs">
                        Home
                    </a>
                </div>
                <div id="pageInputs" class="accordion-body collapse in">
                    <div class="accordion-inner">
                        <div class="tabbable">
                            <ul class="nav nav-tabs" id="myTab">
                                <li class="active">
                                    <a data-toggle="tab" href="#page1Inputs"
                                       ng-click="selectedPage('Page1')">Page1</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#page2Inputs"
                                       ng-click="selectedPage('Page2')">Page2</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div id="page1Inputs"
                                     class="alert alert-info"
                                     ng-show="isPage1Selected"
                                     style="margin-bottom: 0;background-color: transparent;border: 0;">
                                    Page1, Form and Controls
                                </div>
                                <div id="page2Inputs"
                                     class="alert alert-warning"
                                     ng-hide="isPage1Selected"
                                     style="margin-bottom: 0;background-color: transparent;border: 0;">
                                    Page2, Form and Controls

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="compatibilityDetailsHeading" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#toolsPageInputs">
                        Tools
                    </a>
                </div>
                <div id="toolsPageInputs" class="accordion-body collapse">
                    <div class="accordion-inner">
                        <div class="tabbable"> <!-- Only required for left/right tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#horoscope1" data-toggle="tab">Tool 1</a></li>
                                <li><a href="#horoscope2" data-toggle="tab">Tool 2</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="horoscope1">
                                    Tool 1, Input Form and Controls
                                </div>
                                <div class="tab-pane" id="horoscope2" >
                                    Tool 2, Input Form and Controls
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <div class="accordion-group">
                <div id="settingsDetailsHeading" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseSettings">
                        Settings
                    </a>
                </div>
                <div id="collapseSettings" class="accordion-body collapse">
                    <div class="accordion-inner">
                        Update your profile and notification settings
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



