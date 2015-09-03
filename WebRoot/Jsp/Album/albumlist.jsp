
<%@page import="java.util.List"%>
<%@page import="com.c2s.album.dto.AlbumDTO"%><%@ include
	file="/Jsp/Base/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<%@ include file="/Jsp/Base/title.jsp"%>
	<body>
		<html:form action="musiclist.do">
			<table width="100%">
				<%@ include file="/Jsp/Base/logo.jsp"%>
				<tr height="75%">
					<td>
						<table width="100%" align="center" border="1" cellpadding="0">
							<tr bordercolor="white">
								<td></td>
								<td align="right">
									<html:submit property="method" value="add">
										<bean:message key="addnew.button" />
									</html:submit>
									&nbsp;
								</td>
								<td align="left">
									&nbsp;
									<html:submit property="method" value="logoff">
										<bean:message key="logoff.button" />
									</html:submit>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td align="center">
									#
								</td>
								<td>
									Album
								</td>
								<td align="center">
									Year
								</td>
								<td align="center">
									Type
								</td>
								<td align="center">
									Delete
								</td>
							</tr>
							<%
								List<AlbumDTO> albumList = (List<AlbumDTO>) request.getAttribute("albumList");
								int i = 1;
								if (albumList.size() == 0)
								{
							%>
							<tr>
								<td colspan="4" align="center">
									No records found.
								</td>
							</tr>
							<%
								} else
								{
									for (AlbumDTO albumDTO : albumList)
									{
							%>
							<tr>
								<td align="center">
									<%=i++%>
								</td>
								<td>
									<%=albumDTO.getAlbum()%>
								</td>
								<td align="center">
									<%=albumDTO.getYear()%>
								</td>
								<td align="center">
									<%=albumDTO.getType()%>
								</td>
								<td align="center">
									<a href="<%=albumDTO.getDeleteLink()%>">delete</a>
								</td>
							</tr>
							<%
								}
								}
							%>
						</table>
						<%@ include file="/Jsp/Base/footer.jsp"%>
			</table>
		</html:form>
	</body>
</html>
