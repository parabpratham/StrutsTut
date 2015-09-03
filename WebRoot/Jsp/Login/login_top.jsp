<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!--Standard JSP directives for including tag libraries in the
page. The prefix attribute references the library tags throughout the
code-->

<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>

<!--end-->

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
<!--  locale="true"  Generates the top-level <html> element and specifies that the HTTP header will determine the locale to be used to set the language preferences. -->
<head>
	<base href="<%=basePath%>">
	<title><bean:message key="html.title" /></title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="Login">
	<meta http-equiv="description" content="This is my page">
	<!--
			<link rel="stylesheet" type="text/css" href="styles.css">
		-->

</head>

<body>
	<html:form action="login.do" focus="userName">
		<table align="right">
			<tr align="center">
				<td align="right">
					<bean:message key="login.username" />
				</td>
				<td align="left">
					&nbsp;
					<html:text property="userName" size="15" maxlength="15" />
				</td>
				<td align="right">
					<bean:message key="login.password" />
				</td>
				<td align="left">
					&nbsp;
					<html:password property="password" size="15" maxlength="15" />
				</td>
				<td align="center">
					<html:hidden property="method" value="validate" />
					<html:submit>
						<bean:message key="login.button.signon" />
					</html:submit>
				</td>
			</tr>
			<tr align="right">
				<td align="right">
					&nbsp;
				</td>
				<td align="left">
					&nbsp;
					<html:errors property="userName" />
				</td>
				<td align="right">
					&nbsp;
				</td>
				<td align="left">
					&nbsp;
					<html:errors property="password" />
				</td>
				<td align="center">
					<html:errors property="login" />
				</td>
			</tr>
		</table>
	</html:form>
</body>
</html:html>