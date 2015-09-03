<%@ include file="/Jsp/Base/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<%@ include file="/Jsp/Base/title.jsp"%>
	<script type="text/javascript">
	function init()
	{
		getOptions('<%=path%>/album.do?method=getCategoryList','category');
		getOptions('<%=path%>/album.do?method=getTypeList','type');
	}
	</script>
	<style>
#targetDiv {
	background-color: #FFEEAA;
	width: 30%;
}
</style>
	<body onload="init();">
		<html:form action="album.do">
			<table width="100%">
				<%@ include file="/Jsp/Base/logo.jsp"%>
				<tr height="75%">
					<td>
						<table align="center">
							<tr>
								<td colspan="1">
									<bean:message key="create.update.album" />
								</td>
							</tr>
							<tr>
								<td align="right">
									<bean:message key="album.title" />
								</td>
								<td align="left">
									&nbsp;
									<html:text property="album" size="15" maxlength="15" />
									&nbsp;
									<html:errors property="error.album.required" />
								</td>
							</tr>
							<tr>
								<td align="right">
									<bean:message key="album.artist" />
								</td>
								<td align="left">
									&nbsp;
									<html:text property="artist" size="15" maxlength="15" />
									&nbsp;
									<html:errors property="error.artist.required" />
								</td>
							</tr>
							<tr>
								<td align="right">
									<bean:message key="album.type" />
								</td>
								<td align="left">
									&nbsp;
									<select size="1" name="type" id="type">
										<option>
											Select a scheme
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">
									<bean:message key="album.category" />
								</td>
								<td align="left">
									&nbsp;
									<select size="1" name="category" id="category">
										<option>
											Select a scheme
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">
									<bean:message key="album.Description" />
								</td>
								<td align="left">
									&nbsp;
									<html:textarea property="description" />
								</td>
							</tr>
							<tr>
								<td align="right">
									<html:submit property="method" value="update">
										<bean:message key="update.button" />
									</html:submit>
									<html:hidden property="id" />
								</td>
								<td align="left">
									&quot;&quot;
									<html:submit property="action" value="cancel">
									</html:submit>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<%@ include file="/Jsp/Base/footer.jsp"%>
			</table>
		</html:form>
	</body>
</html>
