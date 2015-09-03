<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>Creating the Model</title>

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
			The Model
		</h1>
		<hr>
		<br>
		<div class="Intro">
			<b class="subTopic">Understanding The Model</b>
			<br>
			The data and business logic -- some means to interact with persistent
			storage(such as a database), to retrieve, add, and update the data.
			<br>
			The Model holds and manages the business data and all the business
			functions related to the data. The Model also provides
			implementations for accessing and modifying the business data that
			can be invoked by the View or the Controller.
			<br>
			By separating the Model from the View and the Controller, you can
			share the business data and logic across many different applications
			and different types of applications, such as Web applications,
			client-server applications, and even Business-to-Business (B2B)
			applications.
			<br>
			This flexibility creates a powerful architecture in which systems can
			grow and expand with a business - you can easily extend and scale
			systems to accommodate future demands.
			<br>
			<img src="Images/Model archijpg.jpg"></img>
			<br>
			<hr>
		</div>
		<br>
		<div>
			<b class="subTopic">Working with Business Objects</b>
			<br>
			A business object represents a real-world entity - it can be a
			person, a place, a thing, or a concept. Business objects are taken
			directly from the business domain that you're analyzing. Therefore,
			not only programmers, but the people working in the business
			departments, can relate to these terms and the ideas they represent.
			<br>
			In this manner, business objects provide a common ground in which
			developers and domain experts can discuss and define the requirements
			for developing a software application and are the starting point for
			designing any object-oriented system.
			<br>
			In object-oriented programming, a developer implements business
			objects by creating classes that hold the data related to a
			particular business object and also by defining the operations that
			can be performed on that data, all in one programming language
			structure.
			<br>
			In Java, you use either regular JavaBeans for simple implementations
			of business objects or Enterprise JavaBeans (EJB) for implementing
			business objects as distributed components that users can access over
			the network.
			<br>
			Some good examples of business objects are Customer, Order, and
			Product. Business departments can easily understand these terms, so
			that these terms should definitely become objects in a related
			software application.
			<br>
			<hr>
		</div>
		<br>
		<div>
			<b class="subTopic">Meeting requirements for business objects</b>
			<br>
			Sun Microsystems has defined a set of guidelines for developing
			enterprise architectures with Java called the
			<b class="HighLight">J2EE Blueprints (java.sun.com/ blueprints)</b>.
			<br>
			The Enterprise JavaBeans (EJB) technology, which is an ideal platform
			for implementing business objects, addresses all of Sun's
			requirements. However, not all Web applications are complex enough to
			justify the investment in expertise and money to include an EJB
			application server.
			<br>
			<b class="KeyPoint"> 1. Maintaining state: -- </b> Retain the value
			of data between method invocations and throughout the process of
			shutting down and restarting the Web application.
			<br>
			<b class="KeyPoint"> 2. Reusability: -- </b> A business object is
			general to the entire business, and you should be able to reuse the
			object in different components of the same application or in other
			applications. For example, an order fulfillment application, a
			customer service application, and a billing application could all use
			the same Customer business object. After you define the Customer
			object, you should not need to reimplement the object in each
			application.
			<br>
			<b class="KeyPoint"> 3. Shared data: -- </b> Most business objects
			maintain their state in some kind of database. Many users share the
			data in the database and the business object provides the means to
			access and manipulate the shared data.
			<br>
			<hr>
		</div>
		<div>
			<b class="subTopic">Adding helper classes</b>
			<br>
			In addition to defining business objects that represent real-world
			entities, you need to create additional classes, called helper
			classes. These classes perform the various business functions in the
			Model layer.
			<br>
			Helper classes are implementations of objects that you add during the
			design phase. These classes do not directly represent real-world
			concepts that business people can relate to. Their purpose is to
			improve the flexibility and structure of the programming code. Some
			examples of helper classes follow:
			<br>
			1. A special data class that holds a set of related data items for
			the purpose of handing it from one subsystem to the next.
			<br>
			2. A specialized class or set of classes that implements lower-level
			functions for the sake of efficiency. If you tried to implement these
			functions in the business objects, you would end up with bloated
			classes that would be hard to maintain.
			<br>
			3. A list of business objects, for the purpose of providing
			functionality related to a set of customers or all customers.
			<br>
			<hr>
		</div>
		<div>
			<b class="subTopic">Using JavaBeans</b>
			<br>
			The consensus is that data should be represented as a JavaBean,
			because JavaBeans offer many advantages through their well-defined
			component architecture.
			<br>
			The creators of both JSP and the Struts framework made it easy to
			present data that is encapsulated in a JavaBean. Many specialized
			tags and classes help you to extract data from a data object that
			follows a certain naming convention - and following a certain naming
			convention is the hallmark of a JavaBean.
			<br>
			<hr>
		</div>
		<div>
			<b class="subTopic">Implementing the Model</b>
			<br>
			Struts itself doesn't provide much support for implementing the Model
			portion of a Web application, other than the support for datasource
			implementations.
			<br>
			In a Struts application, the Action classes use JavaBeans to access
			business data or to request the execution of a specific business
			function.
			<br>
			That, however, is their only interaction with the Model layer. The
			underlying mechanics of the Model, such as database interactions,
			data representation, and data manipulation, needs to be implemented
			the developer.
			<br>
			<b class="HighLight">Achieving persistence </b> Persistence means
			that the lifetime of the data outlasts the lifetime of the
			application. The data continues to exist after the application or
			even the computer has been shut down.
			<br>
			Next time the application starts, the same data is still available.
			We're sure that you don't want your data to disappear whenever your
			users close their browsers.
			<br>
			By definition, business objects must be persistent. They represent
			vital business data, such as bank accounts and transactions that must
			be accessible beyond individual invocations of the software
			application.
			<br>
			You can achieve persistence in many ways, but all approaches result
			in a system that writes the data to some kind of permanent storage
			device, usually a hard drive.
			<br>
			More often then not, you gain persistence by connecting the Web
			application to a relational database management system (RDBMS). Other
			alternatives are object-oriented databases or file-based
			repositories.
			<br>
			<hr>
		</div>

	</body>
</html>
