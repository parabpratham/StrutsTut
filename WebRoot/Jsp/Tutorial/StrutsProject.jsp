<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title><bean:message key="html.title" /></title>

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
		<h1>
			A Simple Login Project
		</h1>
		<br>
		<br>

		<b>Designing Your Struts Application</b>
		<br>
		The Login application is simple but still provides you with experience
		with Struts. We set certain minimum design specifications to create a
		Web application based on the Struts framework:
		<br>
		1. At least one View component
		<br>
		2. In the Controller, a subclass of at least one Action class that
		provides specific processing functionality for the application
		<br>
		3. In the Controller, a subclass of the ActionForm associated with
		every View component that submits data
		<br>
		4. For the Model, at least one JavaBean to represent the data
		presented in each View
		<br>
		5.For the configuration files, the required updating
		<br>
		<br>

		<b>Application requirements</b>
		<br>
		1. You want a Log In page that accepts a users name and password as
		input.
		<br>
		2. You want to be able to verify that name and password against a
		repository of name and password combinations.
		<br>
		3. If the application can verify the users input against the
		repository data, the application tells the user so by displaying a
		Success page.
		<br>
		4. If the users input is rejected, the application tells the user and
		asks the user to try logging in again.
		<br>
		<br>

		<b>The steps that you need to take</b>
		<br>
		1. The application displays the Log In page with user name and
		password fields.
		<br>
		2. The user types a name and password and clicks the Log In button.
		<br>
		3. The application checks the submitted values against a repository of
		acceptable values.
		<br>
		4. If the name and password are valid (the combination can be found in
		the data repository), the user is forwarded to a Log In Was Successful
		page and a welcome message appears containing the users name.
		<br>
		5. If the name and password are not valid (the combination cant be
		found in the data repository), the Log In page is redisplayed with an
		appropriate error message.
		<br>
		<br>

		<b>Determining which components to use</b>
		<br>
		In analyzing the requirements, you see that you need not just one View
		but two. Each View requires a JSP page. One JSP provides the initial
		Log In page, and the other JSP is the Successful Log In page.
		<br>
		The first JSP contains a form that has the username and password
		fields. The second JSP needs only a message indicating that the user
		has logged on successfully.
		<br>
		For the Controller, you need one specialized Action class to handle
		the request from the Log In page and one specialized ActionForm class
		to hold the request data.
		<br>
		The Model needs a JavaBean that serves as the data repository. The
		JavaBean contains a list of username and password combinations for
		authorized users and the methods required to operate on that list.
		<br>
		Finally, to make the necessary connections between the components, you
		need to configure and set up the struts-config.xml and web.xml files,
		the two principal configuration files for each Struts application
		<br>
		<br>

		<b>Web application folder structure</b>
		<br>
		A J2EE Web application has a particular folder structure. It starts
		with the applications folder (for example, the Login folder for the
		Login application) and contains at least the WEB-INF folder.The
		WEB-INF folder is required and must reside in the root of the Web
		applications folder.
		<br>
		The WEB-INF folder contains at least two other folders, the classes
		and lib folders. All Java class files that make up your application as
		well as any property files that the application uses reside in the
		classes folder. The lib folder contains all the library files,
		including tag libraries, which your application needs. The root level
		of the WEB-INF folder contains all the configuration files and tag
		library descriptor files.
		<br>
		One of the key points about the WEB-INF folder is that the Web
		container hides it. That means that as far as the browser is
		concerned, the WEB-INF folder doesnt exist. This is an important
		security feature.
		<br>
		Other folders that might be typically found in the application folder
		are folders for organizing imporother files used by the Web pages,
		such as images, JavaScript, CSS (cascading style sheets), and applets.
		All the files in these folders are typically meant to be accessible by
		a browser. HTML and JSP pages may or may not reside in a separate
		folder, depending on the number of pages that make up the application.
		<br>
		<br>
		<h2>
			Creating the JavaServer Pages
		</h2>
		<br>
		<img src="Images/Login.jpg" title="Login.Jsp"></img>
		<img src="Images/LoggedIn.jpg" title="LoggedIn.jpg"></img>
		<!--  Generate A dynamic page explaing components of the JSP -->
		<Br>
		Note: Please check soure code of the Jsp pages for understanding
		<br>
		<br>
		<h2>
			Using message resources
		</h2>
		<br>
		Keeping the text separate from the code makes it easier to change the
		text later, which makes the application easier to maintain.
		<br>
		One of the key mechanisms to handle I18N is to put any text that will
		be displayed for the user into a message resource file.
		<br>
		The format for this file is simply a set of key-value pairs, where the
		key is used as the reference and the value is what is displayed.
		<br>
		For example:
		<b>login.message=Please Log In!</b> In this example, login.message is
		the key and Please Log In! is the value.
		<br>
		The Login application has a message resource file that contains all
		the text that will be displayed on the two JSP pages. Even if I18N was
		not a concern (maybe your application will be used only internally by
		your company), using message resources is still a good idea.
		<br>
		For maintenance, it is generally better not to embed static text in
		your code. By centralizing static text in an external file, you can
		easily make changes to text without disturbing the code.
		<br>
		In the Login application, the name of the message resource file is
		ApplicationResources.properties.
		<br>
		Listing 3-3 shows the key-value pairs that the Login application
		requires. Lines that begin with a number sign (#) are comments.
		<br>
		Any message resource file or other file that you might use needs to be
		on the classpath so that the application can find it.
		<br>
		Because the message resource file is located in the source folder,
		whenever the project gets rebuilt, it will get moved by the build
		process to the classes folder.
		<br>
		Everything in the classes folder is considered on the classpath.
		<br>
		The errors.header and errors.footer are special keys that the html:
		errors tag uses if they are defined. When displaying an error message,
		the html:errors tag will preface the error messages with whatever
		value is associated with the errors.header key. After the error
		messages are displayed, html:errors displays the value found in the
		errors.footer key.
		<br>
		<br>
		<b>Making the Formbean</b>
		<br>
		The ActionForm class is part of the Struts Controller. The ActionForm
		class is associated with a particular View, but could service multiple
		Views, if necessary. ActionForm is an abstract class, so you always
		use a subclass to create a specific version for your View.
		<br>
		The main purpose of the ActionForm subclass is to hold the properties
		of the submitted form. Therefore, it has the properties of a JavaBean
		and is called a formbean. You need to reference every form property
		you need in the ActionForm subclass, such as text fields, radio
		buttons, and hidden properties. In addition, for each property
		defined, there should be getter and setter methods appropriate to
		Beans.
		<br>
		<b>reset method:</b>
		<br>
		<b>validate method:</b>
		<br>
	</body>
</html>
