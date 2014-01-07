<h2 align='center'>About MinimumViable </h2>

<h3>What is MinimumViable?</h3>

MinimumViable is part of a full stack web application we built for running <a href="https://www.jaatakam.com">Jaatakam</a>. It is built on Grails middleware and uses HTML5/KnockoutJS/JQuery for
 front end logic. We feel startups building a minimum viable product could reuse many of the infrastructural components that we have
 built by just modifying the source. MinimumViable provides a skeleton that can be run from day one.

 This functionality comprises  <br/><br/>

<ul>
    <li>A Basic Landing Page with OAuth based authentication </li>
    <li>A Simple Fluid/Responsive Single Page Layout with events handled for page switching</li>
    <li>Template pages which can be customized easily</li>
    <li>SEO Friendly Terms, Privacy and About pages (These are separate pages - <a href="https://medium.com/tech-blogging/aa8bfaa7d469">Why?</a>)</li>
    <li>Integrated social bar/plugin based on Gigya</li>
</ul>

<h3>How to use this framework?</h3>

<uL>
    <li>Fork / Clone this code from Github </li>
    <li>The framework requires Grails 2.2 or higher for development. Using this requires working knowledge of grails</li>
    <li> it can be easily deployed on an Apache Tomcat Web Server as a WAR file </li>
    <li>Download the latest version of grails. Make sure JAVA is in your path.</li>
    <li>Navigate to the MinimumViable directory and type 'grails run-app' to run the framework locally</li>
    <li>Use 'grails war' to create a production deployable war file that can be installed in Tomcat </li>
</uL>

<h3>How to customize?</h3>
<dl>
    <dt>Modify page content</dt>
    <dd>Modify the html code within Page1 and Page2 groovy server pages or create new pages. Check out the gsp
        within the landing directory to add / remove pages and how to handle page events
    </dd>
    <dt>Add new functionality</dt>
    <dd>Add new features and functionality by adding new domain classes and controllers with actions (server) or
        by adding new functional modules in Javascript.
    </dd>
    <dt>Change the database backend</dt>
    <dd>MinimumViable uses the standard H2 database that ships with Grails. But this can be easily changed to Relational or
        NoSQL databases. See the Grails documentation for this. You can even configure multiple concurrent databases
    </dd>
    <dt>Integrate with other web services</dt>
    <dd>This can be done from the client (just use javascript or some library for REST) or the server (Grails has REST plugins) to do this
    </dd>

</dl>

<h3>Prerequisites</h3>

To customize this framework, you need to know

<uL>
    <li> The underpinnings of Grails - Controllers, Domains, URL Routing, Request-Response </li>
    <li> KnockoutJS / JQuery - Or other MVC Javascript framework that include two-way binding</li>
    <li> RequireJS - We use this for structuring Javascript</li>
    <li> Twitter Bootstrap - we use version 2.3. There is no custom CSS</li>
    <li> We also use AmplifyJS for pub-sub messaging in the front end  </li>
</uL>


<div class="alert">When you are done, replace this with your About Product Page !!</div>