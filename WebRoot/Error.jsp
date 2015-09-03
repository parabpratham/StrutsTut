<%@ include file="/Jsp/Base/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
	<%@ include file="/Jsp/Base/title.jsp"%>
	<body>
		<table>
			<%@ include file="/Jsp/Base/logo.jsp"%>
			<tr height="75%">
				<td>

					<!--  Enter Page Here -->
					Error has occurred
					<br>
					Please continue to
					<a href="<%=basePath%>/">home</a>
				</td>
			</tr>
			<%@ include file="/Jsp/Base/footer.jsp"%>
		</table>
	</body>
</html>
