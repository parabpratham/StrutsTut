<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>Controller</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<h1 class="PageTopic">
			Controlling with the Controller
		</h1>
		<br>
		<br>
		<img src="Images/UML diagram of major struts compo.jpg" height="200"></img>
		<br>
		<br>
		<div>
			<b class="subTopic">Principal Controller Classes</b>
			<br>
			<div title="Principal Controller Classes">
				<b class="KeyPoint"> 1. ActionServlet :</b> A subclass of
				javax.servlet.http.HttpServlet, like most Servlets. The
				ActionServlet handles all requests to the Struts framework whose URL
				ends in '.do'
				<br>
				<b class="KeyPoint"> 2. RequestProcessor: </b> The workhorse of the
				Controller, whose main functions are to gather all necessary
				resources for a request by using the configurations in the
				struts-config.xml file and pass control to the proper Action
				subclass.
				<br>
				<b class="KeyPoint"> 3. Action: </b> generic abstract class to
				handle specific requests from the client, that is, the user. You
				always subclass this class (creating new subclasses such as
				MyAction1, MyAction2, . . . MyActionN) for the particular needs of
				the request.
				<br>
				<b class="KeyPoint"> 4. ModuleConfig: </b>A class containing all the
				configuration information for each module in the application. Much
				of this configuration information is represented in the classes that
				follow.
				<br>
				<b class="KeyPoint"> 5. ActionConfig and ActionMapping: </b> These
				classes contain all the mapping information needed to map a
				particular request to a particular Action class. ActionMapping
				extends ActionConfig.
				<br>
				<b class="KeyPoint"> 6. FormBeanConfig and ActionFormBean: </b>
				These classes represent a FormBean. ActionFormBean extends
				FormBeanConfig.
				<br>
				<b class="KeyPoint"> 7. ForwardConfig and ActionForward: </b> These
				classes represent destinations to which an Action might direct the
				RequestProcessor to forward or redirect a request. ActionForward
				extends ForwardConfig. Struts will create an ActionForward class for
				each forward definition in the struts-config.xml file.
				<br>
				<b class="KeyPoint"> 8. MessageResourcesConfig: </b> Represents
				MessageResources associated with a module of a Struts application.
				eg ApplicationResources.properties
				<br>
				<b class="KeyPoint"> 9. DataSourceConfig: </b> Represents datasource
				elements in the strutsconfig file. DataSources are implementations
				of the javax.sql. DataSource interface that provide database
				connection management and pooling.
				<br>
				<b class="KeyPoint">10. ExceptionConfig: </b>Represents exception
				elements in the struts-config file. An exception element defines how
				Struts will react to particular types of exceptions.
				<br>
				<b class="KeyPoint">11. PluginConfig: </b> Represents plug-in
				elements in the struts-config file.
			</div>
			<hr>
			<br>
		</div>

		<br>
		<div>
			<b class="subTopic">The ActionServlet</b>
			<br>
			The ActionServlet class is the front-line soldier in the Struts
			Controller and is responsible for handling all requests that come to
			the Web application. Frankly, the ActionServlet doesn't do very much,
			but it' still important because it is the first to act.
			<br>
			Starting the Servlet : When the Web container starts, it looks in the
			web.xml file of each Web application it is serving and starts the
			described Servlets in the prescribed order as defined in web.xml.
			Generally, the ActionServlet is the first Servlet started in a Struts
			application.
			<br>
			Because the ActionServlet is just like any other Servlet, it
			overrides the init method of its parent class, HttpServlet. The Web
			container calls the init method to allow the Servlet to initialize
			whatever resources the Servlet needs to run. ActionServlet does the
			bulk of its work during this initialization phase. This phase creates
			all the resources needed by the Servlet and the modules.
			<br>
			An application can be made of one or more modules. Each module
			represents a logical set of functionality that together makes the
			application a whole. Each module has its own struts-config.xml file.
			ActionServlet must be made aware of additional modules. This is
			accomplished in the ActionServlet configuration found in the web.xml
			file. For example, if you want to have a separate module named
			purchasing that's configured in its own struts-config.xml file, you
			add that information as follows to the web.xml file:
			<br>
			<img src="Images/multiple struts1.jpg"></img>
			<br>
			The default module is defined by the struts-config.xml file while the
			purchasing module uses the struts-config-purch.xml To switch from one
			module to another, use the SwitchAction mechanism
			<!-- add link -->
			(described later in the chapter) or use the module name in the
			forward definition
			<br>
			<b class="HighLight">forward name="success"
				contextRelative="true" path="/Purchasing/index.do" redirect="true"</b>
			<hr>
			<br>
		</div>
		<br>
		<div>
			Steps that ActionServlet takes at initialization time :
			<br>
			<div title="Steps that ActionServlet takes at initialization time">
				<b class="KeyPoint"> 1. Creates the message resources used
					internally by ActionServlet.</b>
				<br>
				<b class="KeyPoint"> 2. Defines some of the global
					characteristics of the application, including the location of the
					struts-config.xml file.</b> Normally the struts-config.xml file is in
				the WEB-INF folder. However, you can define the struts-config.xml
				file to be in some other location. You specify this in the web.xml
				file, which passes the new location as a parameter to ActionServlet.
				<br>
				<b class="KeyPoint"> 3. Sets up the Servlet mapping that
					determines how this ActionServlet is accessed.</b>
				<br>
				<b class="KeyPoint"> 4. Creates the ModuleConfig instance for
					the first (and possibly only) module in the application.</b>
				<br>
				<b class="KeyPoint"> 5. Initializes the message resources for
					each module.</b>
				<br>
				<img src="Images/multilevel struts.jpg"></img>
				<br>
				<b class="KeyPoint"> 6. Initializes the data resources for this
					module.</b>
				<br>
				<b class="KeyPoint"> 7. Initializes the plug-ins for this module</b>
				<br>
				<b class="KeyPoint"> 8. Freezes the configuration for this
					module.</b>
				<br>
				<b class="KeyPoint"> 9. Repeats Steps 4 through 8 for any
					additional modules.</b>
				<br>
			</div>
			<hr>
		</div>
		<br>
		<div>
			<b class="subTopic">Processing requests :</b>
			<br>
			After ActionServlet is initialized, it is ready for its main purpose:
			handling user requests. When a request comes in from the client, the
			Web container routes the request to ActionServlet. How do you know
			this? Step 3 in the ActionServlet initialization process, just
			listed, states that the web.xml file defines the URL pattern that
			this Servlet handles. Any request for the application must have the
			defined pattern in its URL (usually *.do), and therefore the Web
			container routes the request to the ActionServlet.
			<br>
			Every request is handled by the process method. The process method
			first adds ModuleConfig and MessageResources to the request. If the
			application has more than one module, the module's particular
			ModuleConfig and MessageResources are used. Then ActionServlet gets
			the Request Processor instance for the module being called and calls
			the process method of RequestProcessor, the real workhorse of request
			processing in Struts.
			<br>
			ActionServlet is finished - at least until the next request comes in
			or the container shuts down.
			<hr>
		</div>
		<br>
		<div>
			<b class="subTopic">Shutting down the Servlet</b>
			<br>
			When it's time to shut down the application, the Web container calls
			the ActionServlet's destroy method to notify ActionServlet of the
			impending shutdown. This is a standard method of the HttpServlet
			class that ActionServlet overrides. During the execution of this
			method, ActionServlet releases any resources generated during the
			initialization phase - module resources, datasource resources,
			internal message resources, and the logger resource.
			<hr>
		</div>
		<br>
		<br>
		<div>
			<b class="subTopic">RequestProcessor</b>
			<br>
			<br>
			<i>Action Servlet tells RequestProcessor, "dig here" and
				RequestProcessor does most of the work.</i>
			<br>
			<br>
			ActionServlet calls the RequestProcessor's process method to handle
			the incoming request. The process method then performs a series of
			steps, gathering resources for the request, calling the specific
			actions that act on the request, and finally forwarding or
			redirecting the response to the appropriate destination.
			<br>
			<br>
			Steps taken by RequestProcessor for each request it handles:
			<br>
			<div title="Steps taken by RequestProcessor">
				<b class="KeyPoint"> 1. Wraps the request in a special wrapper
					if the request's content type is multipart/form-data. -- </b>Struts
				includes a library to provide file upload services. You put that
				library (commons-fileupload.jar) in the WEB-INF/lib folder. When a
				user uploads a file, the file has a special content type of
				multipart/ form-data. When the RequestProcessor finds a request with
				that special type, it puts the request in a special wrapper class so
				that the request can be processed more easily.
				<br>
				<b class="KeyPoint"> 2. Gets the path in order to select the
					mapping. -- </b>RequestProcessor determines from the request URL the
				path that caused the request and then uses that path in Step 7 to
				determine which ActionMapping to select.
				<br>
				<b class="KeyPoint"> 3. Selects the Locale for the request in
					the session scope, if configured to do so. -- </b> By default, the
				Locale of the request is set into the session scope. To change it,
				you would need to specify a different ControllerConfig class in the
				struts-config.xml file and set the locale attribute to false. A
				Locale represents a user's language and geographical region. By
				knowing the Locale, the application can customize the language and
				regional formatting for values such as dates and money.
				<br>
				<b class="KeyPoint"> 4. Sets the content type for the response,
					if configured to do so in the struts-config file. -- </b> Otherwise,
				the content type is the standard text/html. This can be changed by
				specifying a different ControlConfig class and setting the
				contentType attribute to another valid value.
				<br>
				<b class="KeyPoint"> 5. Sets a no-cache header to disallow
					caching of the page, if configured to do so. -- </b> By default,
				caching is allowed. To disallow caching, you must specify a
				different ControllerConfig class and set the noCache attribute to
				true.
				<br>
				<b class="KeyPoint"> 6. Performs custom preprocessing, if
					defined in a subclass. -- </b> The processPreprocess method is a hook
				(an empty method designed to be overridden) to allow developers to
				add custom preprocessing logic to each request. To make use of
				preprocessing, you need to subclass the RequestProcessor class and
				override the processPreprocess method.
				<br>
				<b class="KeyPoint"> 7. Gets the ActionMapping instance to use.
					-- </b> Based on the path used for the request, RequestProcessor looks
				up the ActionMapping instance. ActionMapping determines which of the
				Action classes to call to process the request.
				<br>
				<b class="KeyPoint"> 8. Checks security roles for this action to
					make sure that the user can perform it. -- </b> The Web container has a
				built-in security architecture that each application can use. If the
				application uses the built-in security, the strutsconfig file
				defines how to use it. This step verifies that the current user can
				perform any specific action
				<br>
				<b class="KeyPoint"> 9. Gets the ActionForm instance associated
					with the request. -- </b> RequestProcessor gets ActionForm associated
				with this action based on ActionMapping. If ActionForm does not yet
				exist, RequestProcessor creates it.
				<br>
				<b class="KeyPoint">10. Populates ActionForm.</b>
				<br>
				<b class="KeyPoint">11. Validates ActionForm.</b>
				<br>
				<b class="KeyPoint">12. Processes a forward or include if
					specified in ActionMapping.</b>
				<br>
				<b class="KeyPoint">13. Calls the execute method on the specific
					Action class.</b>
				<br>
				<b class="KeyPoint">14. Forwards or redirects to the destination
					specified by ActionForward.</b>
			</div>
			<hr>
		</div>
		<br>
		<div>
			<b class="subTopic">Extending ActionClass</b>
			<br>
			When you start to work with the Action class you have to extend the
			Struts framework to accommodate the particular needs of your
			application. Action Servlet and RequestProcessor can be extended.
			<br>
			But you must extend the Action class for two reasons:
			<br>
			1. The Action class is a Struts class that must be subclassed to be
			used.
			<br>
			2. Action subclasses are the only way for you to process a userss
			request.
			<br>
			<i>Action subclasses must be thread-safe </i> because
			RequestProcessor creates only one instance of each Action subclass.
			<br>
			If more than one user requests at the same time that the same action
			be performed, the one instance of the Action class will be called on
			to do multiple tasks. Therefore, you must use only local variables.
			<br>
			When a request comes in, RequestProcessor needs to know which Action
			subclass should have control. RequestProcessor finds the necessary
			information from the ActionMapping instance that relates the request
			URL with a particular Action class. The ActionMapping instance also
			indicates which ActionForm should be used with the request. You
			provide the necessary information for ActionMapping when you define
			the action mappings in the struts-config file.
			<br>
			<br>
			<div>
				<b>Using the execute method</b>
				<br>
				This method is the principal worker method in the class. In the
				execute method you define all the operations that are necessary to
				handle the request. However, you should not embed all logic in the
				execute method. In fact, if you need to apply some business rules or
				operations, you should create a separate set of business objects. If
				you follow the MVC model, the Model should be responsible for
				business logic and data manipulation. The Controller just makes
				decisions about the flow of control.
				<br>
			</div>
			<br>
			Action class performs the following steps:
			<div title="Action class Steps">
				<br>
				<b class="KeyPoint"> 1. Verifies the user. -- </b> If this Action is
				a protected operation (requiring authorization), the first thing
				Action should do is to verify the users authorization. (If youre
				using Web-container-based security, you hand over user verification
				to the Web container.) Verification could take many forms depending
				on what kind of authorization scheme you use.
				<br>
				<b class="KeyPoint"> 2. Determines which action needs to be
					performed and performs the action. -- </b> If the action is simple and
				straightforward, you need only one action. Sometimes, you may have
				two or more choices depending on some form parameter. For example,
				you may have a page that displays a list of all purchase orders for
				a particular user. Let's say that the page contains a button that
				enables the user to display the purchase orders for a particular
				date. You have one Action class that handles both the initial
				request and subsequent requests for particular purchase orders. In
				your execute method, you need to know whether to display all
				purchase orders for the user or perform a search based on a
				particular date. Therefore, you need to check a form parameter to
				determine which operation to perform.
				<br>
				<b class="KeyPoint"> 3. Sets or updates the necessary attributes
					that the destination page will need. -- </b> This may mean putting a
				JavaBean into one of the scopes, or it may mean updating a formbean
				so that when the page is redisplayed it has the updated values.
				<br>
				<b class="KeyPoint"> 4. Returns an appropriate ActionForward
					object to display the proper View. -- </b> The ActionForward object
				will have all the information needed for the RequestProcessor to
				determine where to forward control.
			</div>
			<br>
			<div>
				Predefined Action classes :
				<br>
				<br>
				<b class="KeyPoint"> 1. ForwardAction -- </b>
				<div>
					The ForwardAction class is useful when you're trying to integrate
					Struts into an existing application that uses Servlets to perform
					business logic functions. You can use this class to take advantage
					of the Struts controller and its functionality, without having to
					rewrite the existing Servlets. Use ForwardAction to forward a
					request to another resource in your application, such as a Servlet
					that already does business logic processing or even another JSP
					page. By using this predefined action, you don't have to write your
					own Action class. You just have to set up the struts-config file
					properly to use ForwardAction
					<br>
					The type attribute is the full class name of the ForwardAction
					class. The parameter attribute is pointing to the path of the
					resource you want to forward control to. The other attributes are
					like normal action definitions.
					<br>
					<img src="Images/ForwardAction.jpg" />
					<br>
				</div>
				<br>
				<b class="KeyPoint"> 2. IncludeAction -- </b>
				<div>
					Use the IncludeAction class to include another resource in the
					response to the request being processed. All that you have to do is
					set up the struts-config file properly to use IncludeAction, no
					extension of the class is necessary.
					<br>
					The type attribute is the full class name of the IncludeAction
					class. The parameter attribute is pointing to the path of the
					resource you want to include. The other attributes are like normal
					action definitions.
					<br>
					<img src="Images/IncludeAction.jpg"></img>
					<br>
				</div>
				<br>
				<b class="KeyPoint"> 3. SwitchAction -- </b>
				<div>
					The SwitchAction class provides a means to switch from a resource
					in one module to another resource in a different module.
					SwitchAction is useful only if you have multiple modules in your
					Struts application. The SwitchAction class can be used as is,
					without extending. To switch to another resource in a different
					module, set up an action path using SwitchAction in the
					struts-config file, as shown in this code snippet :
					<br>
					<img src="Images/switchaction1.jpg">
					<br>
					Then whenever you want to accomplish a switch, you use the
					/toModule path in your URL along with two parameters:
					<br>
					1. The prefix parameter indicates which module you want to switch
					to.
					<br>
					2. The page parameter indicates which URL gets control after
					switching modules.
					<br>
					For example, if you want to switch to the purchasing.do URL in
					module2, your URL might look like this:
					<br>
					<i>http://localhost/toModule.do?prefix=/module2&page=/
						purchasing.do</i>
					<br>
					When you switch back to the default module, use an empty string for
					the prefix parameter, as in the following URL:
					<br>
					<i>http://localhost/toModule.do?prefix=&page=/index.do</i>
					<br>
				</div>
				<br>
				<b class="KeyPoint"> 4. DispatchAction -- </b>
				<div>
					The DispatchAction class is for developers who want to have
					numerous similar actions in a single Action class. You may have a
					View that offers user many possible actions to perform.
					<br>
					For example, suppose that you have a page with a list of purchase
					orders that the user can sort, void, or print. These actions all
					relate to the list of purchase orders, so you might implement a
					single Action class to handle the possible actions. Rather than
					crowd the execute method with a series of if-then-else statements,
					you may opt to create separate methods that each handle one
					possible action from the user. The DispatchAction class is abstract
					and must be extended to be used.
					<br>
					In the purchasing order example, you could create a separate method
					(sort, print, and void) for each of the possible actions. These
					methods would need the same method signature as the standard
					execute method found in the Action class.
					<br>
					execute method signature: --
					<i>public ActionForward execute(ActionMapping mapping,
						ActionForm form, HttpServletRequest request, HttpServletResponse
						response) throws Exception</i>
					<br>
					Your three method signatures would look just like the execute
					method signature, down to the fact that your new methods return an
					ActionForward object.
					<br>
					Following is an example of how to define the sort method signature:
					<br>
					<i>public ActionForward sort(ActionMapping mapping, ActionForm
						form, HttpServletRequest request, HttpServletResponse response)
						throws Exception</i>
					<br>
					When you extend the DispatchAction class, do not override the
					execute action methods. method. That method is now responsible for
					calling one of your defined
					<br>
					The final step is to configure strut-config to make use of
					DispatchAction. The configuration is just like configuring any
					action except for the parameter attribute. The value of the
					parameter attribute defines the name of the request parameter that
					will pass along the name of the method to be executed. If you want
					to call the sort method for the polist action, you use the
					following URL:
					<br>
					<i>http://localhost/myapp/polist.do?method=sort</i>
					<br>
					Example for configuring DispatchAction:
					<br>
					<img src="Images/dispatchaction.jpg"></img>
					<br>
				</div>
				<br>
				<b class="KeyPoint"> 5. LookupDispatchAction -- </b>
				<div>
					The predefined LookupDispatchAction is similar to DispatchAction,
					in that you define in one Action multiple methods that handle
					similar actions. The difference between LookupDispatchAction and
					DispatchAction is that the actual method that gets called in
					LookupDispatchAction is based on a lookup of a key value instead of
					specifying the method name directly.
					<br>
					The LookupDispatchAction class is abstract and must be extended to
					be used.
					<br>
					The entry into the configuration file is similar to DispatchAction.
					The parameter attribute contains the name of the request parameter.
					<br>
					This time, however,
					<b class="HighLight">the value in the parameter is not a method
						name but a key used to look up the method name</b>:
					<br>
					<img src="Images/lookupdispach.jpg"></img>
					<br>
					The type attribute is the full class name of the extended
					LookupDispatch Action class. The parameter attribute names the
					request parameter action. The remaining attributes are defined like
					any other standard action definition.
					<br>
					Because the method to be looked up is based on a key value,
					LookupDispatch Action is more suited to an application that
					contains multiple submit buttons with the same name (but different
					labels and different actions) on a single page, as in the code
					segment that follows:
					<br>
					<img src="Images/lookupdispach_jsp.jpg"></img>
					<br>
					The lines 2 and 5 are defining a submit button whose name is
					action. Lines 3 and 6 define how the buttons are labeled and also
					what value is submitted when the button is clicked.
					<br>
					When the form is submitted, action will be a request parameter and
					the button's label will be the value. Assume that the following
					keys are part of the ApplicationResources. properties file:
					<br>
					<i>button.add=Add Record</i>
					<br>
					<i>button.delete=Delete Record</i>
					<br>
					Extend LookupDispatchAction in a manner similar to how you extend
					DispatchAction: In this example, if the first button is clicked,
					the action parameter contains the Add Record string. If the second
					button is clicked, the action parameter contains Delete Record.
					<br>
					1. You do not override the execute method.
					<br>
					2. You need to create your specialized methods to handle each of
					the actions to be serviced. These methods need to have the same
					method signature as the execute method.
					<br>
					<div>
						3.You must create a protected method named
						<b class="HighLight"><i>getKeyMethodMap</i> </b> that returns a
						Map. In the implementation of the method, you need to create a
						HashMap and enter key-value pairs. The key corresponds to the keys
						used in defining the buttons on your forms. The value is the name
						of the associated method to invoke.
						<br>
						Example of implementing getKeyMapMethod:
						<br>
						<br>
						<i>protected Map getKeyMethodMap() {<br> Map map = new
							HashMap(); map.put("button.add", "add"); // add is the method to
							invoke <br> map.put("button.delete", "delete"); // delete is
							the method to invoke return map; <br>}</i>
						<br>
						<br>
						'add' and 'delete' methods to be implemented:
						<br>
						<i> public ActionForward add(ActionMapping mapping, ActionForm
							form, HttpServletRequest request, HttpServletResponse response)
							throws IOException, ServletException {<br> // do add logic
							here. . . <br> } <br> <br>public ActionForward
							delete(ActionMapping mapping, ActionForm form, HttpServletRequest
							request, HttpServletResponse response) throws IOException,
							ServletException{<br>// do add logic here. . . <br> } </i>
					</div>
				</div>
			</div>
			<hr>
		</div>
		<br>
	</body>
</html>
