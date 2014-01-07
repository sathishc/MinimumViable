<div class="navbar navbar-fixed-bottom" role="contentinfo" xmlns="http://www.w3.org/1999/html">
    <div class="navbar-inner" style="background: url('/images/black.jpg')">
        <div class="container" style="padding-top: 10px;">
            <a href="https://plus.google.com/113291609537320459589" rel="publisher" style="display: none;">Google+</a>
            <div style="float: left;">
                <script type="text/javascript" src="https://cdns.gigya.com/js/socialize.js?apiKey=3_nSZfW_b13ZCaoPh_v3HyeQzr-QAe4GIw-uyyqLDEVu0WH0w46mz2foTntrG3gVEE">
                </script>
                <div id="shareDiv" style="display: inline;"></div>
            </div>

            <div style="float: right;color: #ffffff;">
                <a href="#"
                   id="contactLinkId"
                   rel="popover"
                   data-html="true"
                   data-trigger="click"
                   data-placement="top"
                   data-content="<span style='color:gray'>SquarePrism Software <br> ph +918042280562 </span> <br> <a href='mailto:support@squareprism.com'>support@squareprism.com</a> <br> <a href='http://www.squareprism.com'>www.squareprism.com</a>"
                   data-original-title="<span style='color:black'>Contact Details</span>"
                >
                    ©2013 <i class="icon-map-marker" title="Click to see contact details"></i>
                </a>
            </div>

            <sec:ifLoggedIn>
            <button class="btn btn-link"  data-toggle="collapse" data-target="#commentsComponent" style="padding: 5px;padding-top:0;padding-bottom: 10px;margin-top: 0; display: inline;float: left;color: #f5f5f5;">
              Tell us how we can make this MVP even better !!
            </button>
            <span class="fb-comments collapse span7"
                  data-href="http://www.minimumviable.in"
                  data-width="470" data-num-posts="2"
                  data-colorscheme="dark"
                  data-order_by="reverse_time"
                  style="max-height: 200px;overflow-y: scroll;"
                  id="commentsComponent">
            </span>
            </sec:ifLoggedIn>
        </div>
    </div>
</div>

<sec:ifLoggedIn>
<g:render template="/layouts/modalDialogs" />

<script type="text/html" id="horoscopeProfileChartTemplate">
    <div class="well" style="background-color:white;">
        <div class="well-small">
            <span>
                <span data-bind="text:profileType"></span> for

                <span data-bind="text:profileName"></span>
            </span>
            <span class="pull-right">
                <a href="#" class="btn btn-info btn-mini saveAsPDFButton" target="_blank" data-bind="attr:{href:'/print/profile/' + objectId}">Save as PDF</a>
                <a class="btn btn-info btn-mini activeEmailShareButton" href="#">Email Friend</a>

                <a class="btn btn-info btn-mini activePublicProfileShareButton" href="#">Share link</a>

                <a href="#" class="btn btn-danger btn-mini deleteProfileChartButton"

                   data-deleting-text="Deleting..">
                    Delete
                </a>
            </span>
        </div>

        <div class="well" style="margin-top:10px;">

            <div data-bind="text:profileDetails"></div>
        </div>

        <div class="row-fluid">
            <div class="well span6" style="background-color:white;">
                <div>Natal Chart</div>
                <img class="img-rounded " data-bind="attr:{src:imageUrl,alt:profileName}" />
            </div>
            <div class="well span6" style="background-color:white;">
                <div>Navamsa Chart</div>
                <img class="img-rounded " data-bind="attr:{src:navamsaUrl,alt:profileName}" />
            </div>
        </div>

        <div class="well-small" data-bind="visible:profileTable.length>0">

            <table class="table table-bordered table-striped table-condensed">
                <thead style="margin-bottom:50px;font-weight: bold;">
                <tr>
                    <td align="center">Dasa at Birth</td>
                    <td>Balance</td>
                    <td>Years</td>
                    <td>Months</td>
                    <td>Days</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td data-bind="text:dasaBalance.natalDasha"></td>
                    <td data-bind="text:dasaBalance.balance"></td>
                    <td data-bind="text:dasaBalance.balanceYears"></td>
                    <td data-bind="text:dasaBalance.balanceMonths"></td>
                    <td data-bind="text:dasaBalance.balanceDays"></td>
                </tr>
                </tbody>
            </table>

            <table class="table table-bordered table-striped table-condensed">
                <thead style="margin-bottom:50px;font-weight: bold;">
                <tr><td align="center">Planet</td> <td>Zodiac House</td> <td>Degrees</td></tr>
                </thead>
                <tbody data-bind="foreach:profileTable">
                <tr data-bind="visible:$data.name != 'name'">
                    <td data-bind="text:$data.name"></td>
                    <td data-bind="text:$data.house"></td>
                    <td data-bind="text:$data.degree"></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</script>

<script type="text/html" id="predictionProfileChartTemplate">
    <div class="well" style="background-color:white;">
        <div class="well-small">
            <span>
                <span data-bind="text:profileType"></span> for

                <span data-bind="text:profileName"></span>  <span data-bind="visible:dateOfPrediction!=''">as on <span data-bind="text:dateOfPrediction"></span></span>
            </span>
            <span class="pull-right">
                <a class="btn btn-info btn-mini activePublicProfileShareButton" href="#">Post link</a>
                <a href="#" class="btn btn-mini btn-danger deleteProfileChartButton"
                   data-deleting-text="Deleting..">
                    Delete
                </a>
            </span>
        </div>
        <div class="well" style="margin-top:10px;">

            <div data-bind="text:profileDetails"></div>
        </div>
        <div class="row-fluid">
            <div class="well span6 offset3" style="background-color:white;">
                <div>Prediction Chart</div>
                <img class="img-rounded " data-bind="attr:{src:imageUrl,alt:profileName}" />
            </div>

        </div>
        <div class="well-small" data-bind="visible:profileTable.length>0">

            <table class="table table-bordered table-striped table-condensed">
                <thead style="margin-bottom:50px;font-weight: bold;">
                <tr>
                    <td align="center">Planet</td>
                    <td>Present in House</td>
                    <td>Period</td>
                </tr>
                </thead>
                <tbody data-bind="foreach:profileTable">
                <tr data-bind="visible:$data.name != 'name'">
                    <td data-bind="text:$data.name"></td>
                    <td data-bind="text:$data.house"></td>
                    <td data-bind="text:$data.degree"></td>
                </tr>
                <tr data-bind="visible:$data.name != 'name'">
                    <td colspan="3"
                        style="padding-top:5px;padding-bottom:15px"
                        data-bind="text:$data.analysis"></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</script>

<script type="text/html" id="horoscopeTableTemplate">
    <div class="well" style="background-color:white;">

        <div class="well" style="margin-top:10px;">

            <div data-bind="text:summaryAnalysis"></div>
        </div>

        <div class="well-small" data-bind="visible:table().length>0">

            <table class="table table-bordered table-striped table-condensed">
                <thead style="margin-bottom:50px;font-weight: bold;">
                <tr>
                    <td align="center">Dasa at Birth</td>
                    <td>Balance</td>
                    <td>Years</td>
                    <td>Months</td>
                    <td>Days</td>
                </tr>
                </thead>
                <tbody>
                <tr data-bind="with:dasaBalance">
                    <td data-bind="text:$data.natalDasha"></td>
                    <td data-bind="text:$data.balance"></td>
                    <td data-bind="text:$data.balanceYears"></td>
                    <td data-bind="text:$data.balanceMonths"></td>
                    <td data-bind="text:$data.balanceDays"></td>
                </tr>
                </tbody>
            </table>

            <table class="table table-bordered table-striped table-condensed">
                <thead style="margin-bottom:50px;font-weight: bold;">
                <tr><td align="center">Planet</td> <td>Zodiac House</td> <td>Degrees</td></tr>
                </thead>
                <tbody data-bind="foreach:printableDegreesArrayMap">
                <tr data-bind="visible:$data.name != 'name'">
                    <td data-bind="text:$data.name"></td>
                    <td data-bind="text:$data.house"></td>
                    <td data-bind="text:$data.degree"></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</script>

<script type="text/html" id="predictionTableTemplate">
    <div class="well" style="background-color:white;">

        <div class="well" style="margin-top:10px;">

            <div data-bind="text:summaryAnalysis"></div>
        </div>

        <div class="well-small" data-bind="visible:table().length>0">

            <table class="table table-bordered table-striped table-condensed">
                <thead style="margin-bottom:50px;font-weight: bold;">
                <tr>
                    <td align="center">Planet</td>
                    <td>Present in House</td>
                    <td>Period</td>
                </tr>
                </thead>
                <tbody data-bind="foreach:printableDegreesArrayMap">
                <tr data-bind="visible:$data.name != 'name'">
                    <td data-bind="text:$data.name"></td>
                    <td data-bind="text:$data.house"></td>
                    <td data-bind="text:$data.degree"></td>
                </tr>
                <tr data-bind="visible:$data.name != 'name'">
                    <td colspan="3"
                        style="padding-top:5px;padding-bottom:15px"
                        data-bind="text:$data.analysis"></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</script>
</sec:ifLoggedIn>