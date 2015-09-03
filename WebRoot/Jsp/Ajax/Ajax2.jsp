<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%
			String path = request.getContextPath();
		%>
		<title>Using multiple XMLHttpRequest objects</title>

		<style type="text/css">
.television {
	position: absolute;
	z-index: 200;
	background: #FF0000;
	color: #0000FF;
}

#target {
	position: absolute;
	background: #00FF00;
	color: #000000;
}
</style>

		<script language="javascript" src="<%=path%>/Jsp/Scripts/ajax.js"> </script>
		<script language="javascript"
			src="<%=path%>/Jsp/Scripts/libXmlRequest.js"> </script>
		<script language="javascript" src="<%=path%>/Jsp/Scripts/mouseajax.js"> </script>
		<script language="javascript" src="<%=path%>/Jsp/Scripts/XHConn.js"> </script>


		<script>
			function evaluate() {
				var text = "{method: 'adder', operand1: 2, operand2: 3};";
				var jSObject;
				eval("jSObject = " + text);
				eval(jSObject.method + "(" + jSObject.operand1 + "," + jSObject.operand2 + ");");
			}
			function adder(op1, op2) {
				var sum = op1 + op2;
				alert(op1 + " + " + op2 + " = " + sum);
			}
			function callback1(text) {
				document.getElementById("targetDiv1").innerHTML = "Function 1 says " + text;
			}
			function callback2(text) {
				document.getElementById("targetDiv1").innerHTML = "Function 2 says " + text;
			}		
			function decodeXml(a, b)
			{
				var options = b.xdom.getElementsByTagName("option");
				var loopIndex;	
				var div = document.getElementById('targetDiv4');
				div.innerHTML = "The first color is " + options[0].firstChild.data;
			}
</script>
	</head>
	<!-- <body onload="evaluate();"> -->
	<body>
		<H1>
			Downloading images with Ajax and Dynamic HTML
		</H1>
		<form>
			<input type="button" value="Display Message"
				onclick="getDataReturnText('<%=path%>/ch01/data.txt', callback1)">
			<input type="button" value="Display Message 2"
				onclick="getDataReturnText('<%=path%>/ch01/data.txt', callback2)">
			<div id="targetDiv1">
				<p>
					The fetched image will go here.
				</p>
			</div>
			<br>
			<hr>
			<input type="button" value="Display Image 1"
				onclick="getDataReturnText('<%=path%>/ch01/pizzas.txt', callback)">
			<input type="button" value="Display Message 2"
				onclick="getDataReturnText('<%=path%>/ch01/sandwitch.txt', callback)">
			<div id="targetDiv2"
				style="border-left: 1px solid rgb(255, 0, 0); border-right: 1px solid rgb(255, 0, 0); margin-top: 0px; margin-bottom: 0px; padding: 1px; height: 100px;">
				<p>
					The fetched image will go here.
				</p>
			</div>
			<br>
			<hr>
			<select size="1" id="optionList" onchange="setOption()">
				<option>
					Select a scheme
				</option>
			</select>
			<input type="button" value="Use color scheme 1"
				onclick="fillFromDataReturnXml('<%=path%>/album.do?method=getCategoryList', 'optionList');">
			<input type="button" value="Use color scheme 2"
				onclick="fillFromDataReturnXml('<%=path%>/album.do?method=getTypeList', 'optionList');">
			<br>
			<hr>
			<input type="button" value="Display Message"
				onclick="org.cote.js.xml.getXml('<%=path%>/album.do?method=getCategoryList', decodeXml, 1)">
			<div id="targetDiv4">
				<p>
					The decodeXml image will go here.
				</p>
			</div>
			<br>
			<hr>
			<h1>
				Buy a television by dragging it to the shopping cart
			</h1>
			<div id="targetDiv5"></div>
			<div id="television1" class="television"
				style="left: 300px; top: 600px; width: 80px; height: 80px;"
				onmousedown="handleDown(event,'<%=path%>');">
				television1
			</div>
			<div id="television2" class="television"
				style="width: 80px; height: 80px;"
				onmousedown="handleDown(event,'<%=path%>');">
				television2
			</div>
			<div id="target"
				style="left: 300px; top: 700px; width: 200px; height: 100px;">
				Shopping Cart
			</div>
			<br>
			<hr>
			<h1>
				Testing XHConn
			</h1>
			<input type="button" value="Display Message" onclick="testXHConn();">
			<div id="targetDiv6">
				<p>
					The decodeXml image will go here.
				</p>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>

			<hr>
		</form>

	</body>
</html>