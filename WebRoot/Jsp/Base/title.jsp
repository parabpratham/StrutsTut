<%@ include file="/Jsp/Base/taglibs.jsp"%>
<head>
	<%
		String path = request.getContextPath();
	%>
	<title><bean:message key="html.title" />
	</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=path%>/Jsp/Scripts/common.js"></script>
</head>