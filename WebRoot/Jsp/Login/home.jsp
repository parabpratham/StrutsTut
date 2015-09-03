<%@ include file="/Jsp/Base/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<%@ include file="/Jsp/Base/title.jsp"%>
	<%
		String dataSource = path + "/home.do?method=checkLogin";
	%>
	<script type="text/javascript">
	var dataSource = '<%=dataSource%>';
	//For Login
		function validate(dataSource)
		{
			var emailValue=document.getElementById("email").value;
			emailValue= (emailValue=="")?'null':emailValue;
			
			var pwdValue=document.getElementById("password").value;
			pwdValue= (pwdValue=="")?'null':pwdValue;
			
			dataSource = dataSource+'&email='+emailValue+'&pwd='+pwdValue;
			var isValid = getXMLForErrors(dataSource);
			alert("4"+isValid);
			return isValid;
		}
		
	</script>
	<body>
		<table width="100%">
			<%@ include file="/Jsp/Base/logo.jsp"%>
			<tr height="75%">
				<td>
					<table>
						<tr>
							<td>
								<html:form action="home.do" focus="email"
									onsubmit="return validate(dataSource);">
									<table border="1" align="center" width="100%" cellspacing="5">
										<tr valign="top" bordercolor="black">
											<td width="30%">
												<%@ include file="login.jsp"%>
											</td>
											<td rowspan="2">
												&nbsp;
											</td>
										</tr>
										<tr align="center">
											<td>
												<bean:message key="join.message" />
												<br>
												<html:submit property="method">
													<bean:message key="join.button" />
												</html:submit>
											</td>
										</tr>
									</table>
								</html:form>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<%@ include file="/Jsp/Base/footer.jsp"%>
		</table>
	</body>
</html>