<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainLayout"/>
        <link rel="shortcut icon" href="/images/favicon.ico"/>
		<title>Privacy Policy - Minimum Viable</title>


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
        <div class="well" style="margin-bottom: 50px;">
            <div id="mainContainer" class="tab-content">
                <div id="aboutPage" class="tab-pane active" style="height: 605px;">
                    <g:render template="/extras/privacy" />
                </div>
                <div id="home" class="tab-pane">
                    <g:render template="/layouts/landingPage" />
                </div>
            </div>
        </div>
	</body>
</html>







