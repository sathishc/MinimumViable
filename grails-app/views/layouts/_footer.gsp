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
</sec:ifLoggedIn>