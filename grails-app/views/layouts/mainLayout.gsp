<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->


    %{--This is the Main Layout used for landing page, both before and after sign in. it is a two column layout --}%

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<title><g:layoutTitle default="Build a Minimum Viable Product Fast !!"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap -->
        <r:external uri="/css/font-awesome/css/font-awesome.min.css" />
        <r:external uri="/css/bootstrap.min-cerulean.css" />
        <r:external uri="/css/bootstrap-responsive.css" />
        <r:external uri="/css/main.css" />
        <r:external uri="/css/bootstrap-select.css" />
        <r:external uri="/css/datepicker.css" />
        <r:external uri="/css/timepicker.css" />

        <r:external uri="/css/timepicker.css" />



		<g:layoutHead/>

        <sec:ifLoggedIn>
            <script data-main="js/main_logged_in" src="/js/thirdparty/require.js"></script>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <script data-main="js/main_logged_out" src="/js/thirdparty/require.js"></script>
        </sec:ifNotLoggedIn>
	</head>
	<body style="background-size: 100%">
        <div id="fb-root"></div>
        <script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=187213768091934";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
        <div class="container">
            <g:render template="/layouts/header" />


            <g:layoutBody/>


            <g:render template="/layouts/footer" />
        </div>

        <script>
            // Step 1: Construct a UserAction object and fill it with data
            var ua = new gigya.socialize.UserAction();
            ua.setLinkBack("http://www.minimumviable.in");
            ua.setTitle("Homepage for Minimum Viable");

            // Step 2: Define the Share Bar plugin's params object
            var params ={
                userAction:ua,
                shareButtons:'share,facebook-like,twitter-tweet', // list of providers
                containerID: 'shareDiv',
                cid:''
            };

            // Step 3: Load the Share Bar plugin:
            gigya.socialize.showShareBarUI(params);

        </script>
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-37015899-1']);
            //_gaq.push(['_setAccount', 'UA-38693844-1']);  // added minimumviable id for testing
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();

        </script>
    </body>
</html>


