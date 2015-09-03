<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String jspAction = "< jsp:some action // >";
	char a = '>';
	String jspDirective = "<%@ the directive " + a + "%.";
	String jspDeclaration = "<%! declaration %" + a + "";
	String jspExpression = "<%= expression %" + a + "";
	String jspScriptlet = "<% java code %" + a + "";
	String jspComment = "<%-- comment --%" + a + "";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'Introduction.jsp' starting page</title>
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
		<marquee>
			<h1>
				This is my Strust Intro.
			</h1>
		</marquee>
		<br>
		<br>
		<br>

		<H2>
			Getting to Know
			<I>Jakarta Struts</I>
		</H2>
		<img src="Images/Images.jpg" height="500"></img>

		<br>
		<br>
		<b>What Is Jakarta Struts?</b>
		<br>
		<br>
		1.
		<b>Java Servlets:</b> Programs written in Java that reside on a Web
		server and respond to user requests
		<br>
		2.
		<b>JavaServer Pages:</b> A technology for generating Web pages with
		both static and dynamic content
		<br>
		3.
		<b>JavaBeans:</b> Components that follow specific rules, such as
		naming conventions
		<br>
		4.
		<b> Business logic:</b> The code that implements the functionality or
		rules of your specific application
		<br>
		<br>
		<b>High-level view of Web architecture</b>
		<br>
		<img src="Images/High-level view of Web architecture.jpg" height="200" />
		<br>
		<br>
		<b>A Web container</b>
		<br>
		A Web container is a program that manages the components of a Web
		application, in particular JSP pages and Java Servlets. A Web
		container provides a number of services, such as
		<br>
		1.
		<b>Security:</b> Restricted access to components, such as password
		protection
		<br>
		2.
		<b>Concurrency:</b> The capability to process more than one action at
		a time
		<br>
		3.
		<b>Life-cycle management:</b> The process of starting up and shutting
		down a component
		<br>
		eg. Apache Tomcat
		<br>
		<br>
		<b>Using Java Servlets</b>
		<br>
		Java Servlets extend the functionality of a Web server and handle
		requests for something other than a static Web page. They are Java
		answer to CGI (Common Gateway Interface) scripts of olden times. As
		their name implies, you write Java Servlets in Java and usually extend
		the HttpServlet class, which is the base class from which you create
		all Servlets.
		<br>
		<br>
		<b>JavaServer Pages</b>
		<br>
		Has special tags and scriptlets are executed on the server side to
		create the dynamic part of the presentation, so that the page can
		modify its output to reflect the users request.
		<br>
		<b>Life Cycle</b> -- What really happens behind the scenes is that the
		JSP container translates the JSP page into a Java Servlet and then
		compiles the Servlet source code into runnable byte code. This
		translation process happens only the first time a user accesses the
		JSP page. The resulting Servlet is then responsible for generating the
		Web page to send back to the user.
		<br>
		JSP defines six types of
		<b>tag elements</b>:
		<img src="Images/JSP Page.jpg" height="200"></img>
		<br>
		1.
		<b><font color="Red">Action:</font> </b>
		<%=jspAction%><br>
		2.
		<b><font color="Yellow">Directive:</font> </b>
		<%=jspDirective%><br>
		3.
		<b>Declaration:</b>
		<%=jspDeclaration%><br>
		4.
		<b>Expression:</b>
		<%=jspExpression%><br>
		5.
		<b>Scriptlet:</b>
		<%=jspScriptlet%><br>
		6.
		<b><font color="Green">Comment:</font> </b>
		<%=jspComment%><br>
		<br>

		<b>Using JavaBeans</b>
		<br>
		A JavaBean is a special form of Java class that follows certain rules,
		including the methods it uses and its naming conventions.Beans are so
		useful because they are portable, reusable, and platform independent.
		Beans are components because they function as small, independent
		programs. JavaBeans component architecture defines how Beans are
		constructed and how they interact with the program in which they are
		used.
		<br>
		Scope : Scope refers to an area in which an object (such as a Bean or
		any Java class) can be stored.
		<br>
		1.
		<b>Page:</b>only while the page is responding to the current request.
		After control leaves the current page, all objects stored in the page
		scope are destroyed.
		<br>
		2.
		<b>Request:</b>Objects in the request scope are available as long as
		the current request is being serviced. A request can be serviced from
		more than one page.
		<br>
		3.
		<b>Session:</b>The objects in the session scope last as long as the
		session exists. This could be until the user logs out and the session
		is destroyed or until the session times out due to inactivity. Each
		client using the Web application has a unique session.
		<br>
		4.
		<b>Application:</b>The longest lasting scope is the application scope.
		As long as the application is running, the objects exist. Furthermore,
		objects in the application scope are available to all clients using
		the application.
		<br>
		Methods that access or set a property are public (available to anyone
		using the Bean) and also use a certain naming convention. You name
		these methods as follows: To get a propertys value, the method must
		begin with get followed by the property name with the first letter
		capitalized, as in public String getName();.These methods are called
		getters. To set a propertys value, the method must begin with set
		followed by the property name with the first letter capitalized and
		the value to set the property to, as in public void setName(String
		theName);. These methods are called setters.
		<br>
		<br>
		The Web application then does the following:
		<br>
		1. Retrieves a copy of the requested purchase order information from
		the backend database
		<br>
		2. Builds a PurchaseOrder Bean
		<br>
		3. Populates the Bean with the retrieved data
		<br>
		4. Uses the Bean in the JSP page to display the data.
		<br>
		<br>
		<b>Model-View-Controller Design Pattern</b>
		<br>
		A design pattern is a blueprint for constructing a time-tested
		solution to a given problem.
		<br>
		<img src="Images/Model-view.jpg" height="100"></img>
		<br>
		layers of functionality:
		<br>
		1. Model: The data and business logic -- some means to interact with
		persistent storage(such as a database), to retrieve, add, and update
		the data
		<br>
		2. View: The presentation -- responsible for displaying data from the
		Model to the user also sends user data to the Controller
		<br>
		3. <a href="http://localhost:11090/StrutsTut/Jsp/Tutorial/Controller.jsp">Controller:</a> The flow control -- handles all requests from the user
		and selects the view to return. When the Controller receives a
		request, the Controller forwards the request to the appropriate
		handler, which interprets what action to take based on the request.
		The Controller calls on the Model to perform the desired function.
		After the Model has performed the function, the Controller selects the
		View to send back to the user based on the state of the Models data.
		<br>

		MVC pattern Advantages :
		<br>
		1. Greater flexibility
		<br>
		2. Best use of different skill sets
		<br>
		3. Ease of maintenance
		<br>
		<br>
		<b>The Struts Controller</b>
		<br>

		The primary controller class is a Java Servlet called the
		<b>ActionServlet</b>. This class handles all user requests for
		Struts-managed URLs.
		<br>
		<img src="Images/struts mvc pattern.jpg" height="100"></img>
		<br>
		Using information in the configuration files, the ActionServlet class
		then gets the appropriate RequestProcessor class that collects the
		data that is part of the request and puts it into an ActionForm, a
		Bean that contains the data sent from or to the users form. The final
		step of the Controller is to delegate control to the specific handler
		of this request type. This handler is always a subclass of the Action
		class.
		<br>
		The Action subclass is the workhorse of the Controller. It looks at
		the data in the users request (now residing in an ActionForm) and
		determines what action needs to be taken. It may call on the business
		logic of the Model to perform the action, or it may forward the
		request to some other View. The business logic may include interacting
		with a database or objects across the network or may simply involve
		extracting some data from an existing JavaBean.
		<br><img src="Images/struts controller.jpg" height="100"></img><br>
		After the necessary action has been performed, the Action subclass
		then chooses the correct View to send back to the user. The View is
		determined by the current state of the Models data (the model state)
		and the specifications you defined in the Struts configuration file.
	</body>
</html>
