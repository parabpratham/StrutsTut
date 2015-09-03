<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%
			String path = request.getContextPath();
		%>
		<title>Ajax at work</title>
		<script type="text/javascript" src="<%=path%>/Jsp/Scripts/common.js"></script>
		<script language="javascript">
		var counter1 = 0;
		function displayText() {
			var counter2 = 0;
			counter1 = counter1+1;
			counter2 = counter2+1;
			document.getElementById("targetDiv1").innerHTML = "First counter equals " + counter1 + "<br>" + "But the second counter is still stuck at " + counter2;
		}
		
		function clear()
		{
			document.getElementById("targetDiv2").innerHTML = "";
		}

</script>
	</head>
	<body>
		<H1>
			Fetching data with Ajax
		</H1>
		<!-- 
		<form>
			<input type="button" value="Display
				Message"
				onclick="displayText();getData('<%=path%>/ch01/data.txt','targetDiv');">
			<div id="targetDiv">
				The fetched data will go here.
			</div>
		</form>
		 -->
		<div id="targetDiv1"></div>
		<img src="../../ch01/pizzas.jpg" height="100" width="100"
			onmouseover="getData('<%=path%>/ch01/pozzas.txt','targetDiv2');"></img>
		&nbsp;
		<img src="../../ch01/sandwitch.jpg" height="100" width="100"
			onmouseover="getData('<%=path%>/ch01/sandwitch.txt','targetDiv2');"></img>
		&nbsp;
		<img src="../../ch01/soups.jpg" height="100" width="100"
			onmouseover="getData('<%=path%>/ch01/soups.txt','targetDiv2');"></img>
		&nbsp;
		<div id="targetDiv2" onmouseout="clear();">
		</div>
		<h1>
			Using Ajax and XML
		</h1>
		<form>
			<select size="1" id="optionList" onchange="setOption()">
				<option>
					Select a scheme
				</option>
			</select>
			<input type="button" value="scheme 1"
				onclick="getOptions('<%=path%>/album.do?method=getCategoryList','optionList');">

			<input type="button" value="Display Message"
				onclick="getHeadData('<%=path%>/ch01/data.txt', 'targetDiv3')">
			<!-- Server: Apache-Coyote/1.1 
			     Accept-Ranges: bytes 
			     ETag: W/"8-1373993475160" 
			     Last-Modified: Tue, 16 Jul 2013 16:51:15 GMT 
			     Content-Type: text/plain 
			     Content-Length: 8 
			     Date: Thu, 18 Jul 2013 10:12:53 GMT  -->
		</form>
		<div id="targetDiv3">
			Color this text.
		</div>
		<div style="display: none">
			<Ul>
				<li>
				<li>
					0 uninitialized
				</li>
				<li>
					1 loading
				</li>
				<li>
					2 loaded
				</li>
				<li>
					3 interactive
				</li>
				<li>
					4 complete
				</li>
			</Ul>
			<ul>
				<li>
					200 OK
				</li>
				<li>
					201 Created
				</li>
				<li>
					204 No Content
				</li>
				<li>
					205 Reset Content
				</li>
				<li>
					206 Partial Content
				</li>
				<li>
					400 Bad Request
				</li>
				<li>
					401 Unauthorized
				</li>
				<li>
					403 Forbidden
				</li>
				<li>
					404 Not Found
				</li>
				<li>
					405 Method Not Allowed
				</li>
				<li>
					406 Not Acceptable
				</li>
				<li>
					407 Proxy Authentication Required
				</li>
				<li>
					408 Request Timeout
				</li>
				<li>
					411 Length Required
				</li>
				<li>
					413 Requested Entity Too Large
				</li>
				<li>
					414 Requested URL Too Long
				</li>
				<li>
					415 Unsupported Media Type
				</li>
				<li>
					500 Internal Server Error
				</li>
				<li>
					501Not Implemented
				</li>
				<li>
					502 Bad Gateway
				</li>
				<li>
					503 Service Unavailable
				</li>
				<li>
					504 Gateway Timeout
				</li>
				<li>
					505 HTTP Version Not Supported
				</li>
			</ul>
		</div>
		<H1>
			Google live search
		</H1>
		Search for
		<input id="textField" type="text" name="textField"
			onkeyup="getSuggest(event,'<%=path%>');">
		<div id="targetDiv">
			<div></div>
		</div>
	</body>
</html>