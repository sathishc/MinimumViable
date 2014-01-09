define(['path'],function(path){

    /*
        Manage history within the client side url changes using PathJS
     */

    return {
        init:function(){
            // Here we define our routes.  You'll notice that I only define three routes, even
            // though there are four links.  Each route has an action assigned to it (via the
            // `to` method, as well as an `enter` method.  The `enter` method is called before
            // the route is performed, which allows you to do any setup you need (changes classes,
            // performing AJAX calls, adding animations, etc.
            Path.map("/").to(function(){
              $("a[href='#home']").tab('show');
            });

            Path.map("http://localhost:8080").to(function(){
             $("a[href='#home']").tab('show');
            });




            Path.map("/help").to(function(){
               $('a[href="/help"]').tab('show');
            });

            Path.map("/settings").to(function(){
               $('a[href="#settingsPage"]').tab('show');
            });



            // This line is used to start the HTML5 PathJS listener.  This will modify the
            // `window.onpopstate` method accordingly, check that HTML5 is supported, and
            // fall back to hashtags if you tell it to.  Calling it with no arguments will
            // cause it to do nothing if HTML5 is not supported
            //Path.history.listen();

            // If you would like it to gracefully fallback to Hashtags in the event that HTML5
            // isn't supported, just pass `true` into the method.

            Path.history.listen(true);

            $(".astromenu").click(function(event){
               event.preventDefault();

               // To make use of the HTML5 History API, you need to tell your click events to
               // add to the history stack by calling the `Path.history.pushState` method. This
               // method is analogous to the regular `window.history.pushState` method, but
               // wraps calls to it around the PathJS dispatched.  Conveniently, you'll still have
               // access to any state data you assign to it as if you had manually set it via
               // the standard methods.

               $('#mainContainer').scrollTop(0);
               Path.history.pushState({}, "", $(this).attr("href"));
            });


            $(window).resize(function() {
                $('#chartContainer').css({
                    'height': $('#inputContainer').height()
                });
            });
        }

    }

});








