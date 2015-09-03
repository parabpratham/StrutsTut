<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String messageresources = "<message-resources>";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>View</title>

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
			Designing the View
		</h1>
		<br>
		<div>
			<b class="subTopic"></b>
			<br>
			<br>
			<b class="KeyPoint"> 1. Choosing a View technology</b>
			<br>
			<b class="KeyPoint"> 2. Creating applications for an
				international audience</b>
			<br>
			<b class="KeyPoint"> 3. Connecting the View and the Controller</b>
			<br>
			<b class="KeyPoint"> 4. Using the DynaActionForm class for
				automation</b>
			<br>
			<hr>
		</div>
		<div>
			<b class="subTopic">Template engines</b>
			<br>
			<br>
			Template engines are characterized by a separation of the page design
			from page data. This methodology offers several advantages over plain
			vanilla JSP, such as
			<ul class="points">
				<li>
					More flexibility in site design
				</li>
				<li>
					Easier design development for graphics people
				</li>
				<li>
					Greater control of the consistency of the site appearance
				</li>
			</ul>
			Example of template engines.
			<ol class="KeyPoint">
				<li>
					<b>Apache Cocoon and the Cocoon plug-in -- </b>
				</li>
				<li>
					<b class="KeyPoint"> </b>
				</li>
				<li>
					<b class="KeyPoint"> </b>
				</li>
			</ol>

			<hr>
		</div>
		<div>
			<b class="subTopic">Internationalization</b>
			<br>
			When creating a Web application that supports multiple locales, you
			need to consider how to present information in the preferred language
			and customary formatting style of your audience. Customary formatting
			style refers to locale-sensitive information such as dates, times,
			numbers, and currency.
			<br>
			Struts displays I18N text and images through the use of message
			resources and specialized tag libraries.
			<br>
			To create applications with multilanguage capabilities, you work with
			two aspects of Jakarta Struts:
			<ul class="KeyPoint">
				<li>
					<b class="KeyPoint"> The resource bundle properties file -- </b>
					contains all the text that the application will display to the
					user. The file can have any name that you choose but should have an
					extension of .properties. The file may also contain image locations
					if you want to display different images for different locales.
					<br>
					The text and images might be one or more of the following:
					<ul class="Point">
						<li>
							<i class="Point"> Labels on fields and buttons </i>
						</li>
						<li>
							<i class="Point"> Titles of pages or sections and page
								content </i>
						</li>
						<li>
							<i class="Point"> Messages to tell the user something</i>
						</li>
						<li>
							<i class="Point"> Icons that indicate an action to be
								performed </i>
						</li>
					</ul>
					Any content that you need to localize must be in the resource
					bundle. Each entry of text or image location requires a key that
					identifies that text or image location.
					<br>
					For example, the following illustrates a key and the keys
					associated value.
					<br>
					<b class="HighLight"><i>defaultdisk=My Disk</i> </b>(The
					defaultdisk key is used to look up the text value of My Disk.)
					<br>
					Sometimes it may be convenient to divide the key-value pairs into
					different files, especially if you have multiple developers or
					modules in your application. The only requirement is that you set
					them up properly in the struts-config file, as we explain in the
					next section
					<br>
					<br>
					<div>
						<b class="KeyPoint">Configuring the message resources </b>
						<br>
						To tell Struts about your message resources (or resource bundles),
						you need to create a tag in the struts-config file and specify the
						context in the web.xml file.
						<br>
						In the struts-config file, the
						<%=messageresources%>
						tag has five possible attributes:
						<br>
						<ol class="KeyPoint">
							<li>
								<i class="Point"> ClassName: </i> Optional. The fully qualified
								name of the configuration class. This value defaults to
								org.apache.struts.config.Message ResourcesConfig. Use this
								attribute only if you subclass Message ResourcesConfig.
							</li>
							<li>
								<i class="Point"> Factory: </i> Optional. The fully qualified
								name of MessageResources Factory. This value defaults to
								org.apache.struts.util.Property MessageResourcesFactory. Use
								this attribute only if you subclass
								PropertyMessageResourcesFactory.
							</li>
							<li>
								<i class="Point"> Key: </i> Optional. The attribute key to store
								this bundle in the Servlet context. The key defaults to
								org.apache.struts.action.MESSAGE. If you use multiple resource
								bundles in your application, you should set a different key for
								each one. In the application, you would use the key to indicate
								which bundle to select.
							<li>
								<i class="Point"> Null: </i> Optional. Determines how to display
								missing resources. The default value is
								<b class="HighLight">true</b> and displays missing resources as
								<b class="HighLight">null</b>. If you set the value to
								<b class="HighLight">false</b>, the missing resource is
								displayed as
								<b class="HighLight">"???key???"</b>. This option is useful
								during development because it helps you to spot missing
								resources.
							<li>
								<i class="Point"> Parameter: </i>
								<b class="HighLight">Required.</b> The name of the resource
									bundle. This is the name of the message resource file, minus
									the '.properties' extension. 
							</li>
						</ol>
						<br>
						<br>
						Here is an example of a message-resources tag in the struts-config
						file:
						<br>
						<img src="Images/MessageResource1.jpg"></img>
						<br>
						This tag specifies the name of the resource bundle as
						ApplicationResources. Because the null parameter is set to false,
						if the referenced resource is missing, you see a display like
						this: ???key???.
						<br>
						If you have two resource bundles, you need to also define a key
						for each to reference them properly in your application.
						<br>
						Here is an example of configuring the message resources for two
						resource bundles:
						<br><img src="Images/MessageResource2.jpg"></img>
						<br>
					</div>
					<br>

				</li>

				<li>
					<b class="KeyPoint">The tag libraries to reference the resource
						bundles </b>
					<br>
				</li>
			</ul>
			<br>
			<hr>
		</div>

	</body>
</html>
