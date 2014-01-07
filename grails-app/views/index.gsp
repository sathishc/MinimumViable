<!DOCTYPE html>
<html>
	<head>
        %{--<g:if test="${url != 'router'}">
        <!-- Google Analytics Content Experiment code -->
        <script>function utmx_section(){}function utmx(){}(function(){var
                k='67087250-0',d=document,l=d.location,c=d.cookie;
            if(l.search.indexOf('utm_expid='+k)>0)return;
            function f(n){if(c){var i=c.indexOf(n+'=');if(i>-1){var j=c.
                    indexOf(';',i);return escape(c.substring(i+n.length+1,j<0?c.
                    length:j))}}}var x=f('__utmx'),xx=f('__utmxx'),h=l.hash;d.write(
                    '<sc'+'ript src="'+'http'+(l.protocol=='https:'?'s://ssl':
                            '://www')+'.google-analytics.com/ga_exp.js?'+'utmxkey='+k+
                            '&utmx='+(x?x:'')+'&utmxx='+(xx?xx:'')+'&utmxtime='+new Date().
                            valueOf()+(h?'&utmxhash='+escape(h.substr(1)):'')+
                            '" type="text/javascript" charset="utf-8"><\/sc'+'ript>')})();
        </script><script>utmx('url','A/B');</script>
        <!-- End of Google Analytics Content Experiment code -->
        </g:if>--}%

        <meta name="layout" content="mainLayout"/>
        <meta name="description" content="Setup a Minimum Viable Product Really Fast" />
        <meta name="keywords" content="mvp, build, measure, learn, startup, online, product" />
        <link rel="shortcut icon" href="/images/favicon.ico" />
		<title>
            Build a Minimum Viable Product Fast !!
        </title>


        <style type="text/css">

          svg {
            border: 1px solid gray;
          }

          rect {
            fill: steelblue;
          }
        </style>
	</head>
	<body>
        <div style="margin-bottom: 50px;">
            <div id="mainContainer" class="tab-content">
                <div id="home" class="tab-pane active">
                    <g:render template="/layouts/landingPage" />
                </div>
            </div>
        </div>
	</body>
</html>







