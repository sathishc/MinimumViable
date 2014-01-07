<div class="tab-content" style="height: 100%;">
    <div class="tab-pane active fade in"
         id="page1Content"
         style="height: 100%;overflow: hidden;">
        <g:render template="/pages/page1Content" />
    </div>
    <div class="tab-pane fade in"
         id="page2Content"
         style="height: 100%;overflow: hidden;">
        <g:render template="/pages/page2Content" />
    </div>
    <div class="tab-pane fade in"
         id="toolsPageContent"
         style="height: 100%;overflow: hidden;">
        <g:render template="/pages/toolsPageOutput" />
    </div>

    <div class="tab-pane fade in"
         data-bind="module:{name:'userController'}"
         id="settingsOutput"
         style="height: 100%;">
        <g:render template="/pages/settingsPage" />
    </div>
</div>