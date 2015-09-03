
function getXMLHttpRequestObject() {
	var XMLHttpRequestObject = false;
	if (window.XMLHttpRequest) {
		XMLHttpRequestObject = new XMLHttpRequest();
	} else {
		if (window.ActiveXObject) {
			XMLHttpRequestObject = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return XMLHttpRequestObject;
}
function getData(dataSource, divID) {
	var XMLHttpRequestObject = getXMLHttpRequestObject();
	if (XMLHttpRequestObject) {
		var obj = document.getElementById(divID);
		XMLHttpRequestObject.open("GET", dataSource);
		XMLHttpRequestObject.onreadystatechange = function () {
			if (XMLHttpRequestObject.readyState == 4 && XMLHttpRequestObject.status == 200) {
				obj.innerHTML = XMLHttpRequestObject.responseText;
			}
		};
		XMLHttpRequestObject.send(null);
	}
}
function getData(dataSource, divID, parameter) {
	var XMLHttpRequestObject = getXMLHttpRequestObject();
	if (XMLHttpRequestObject) {
		var obj = document.getElementById(divID);
		XMLHttpRequestObject.open("POST", dataSource);
		XMLHttpRequestObject.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		XMLHttpRequestObject.onreadystatechange = function () {
			if (XMLHttpRequestObject.readyState == 4 && XMLHttpRequestObject.status == 200) {
				obj.innerHTML = XMLHttpRequestObject.responseText;
			}
		};
		XMLHttpRequestObject.send(parameter);
		//XMLHttpRequestObject.send("scheme=" + scheme);
		
		//XMLHttpRequestObject.setRequestHeader("Content-Type", "text/xml")
		//XMLHttpRequestObject.send("<doc><name>limit</name><data>5</data></doc>");
	}
}
function getOptions(dataSource, optionList) {
	try {
		var options;
		var XMLHttpRequestObject = getXMLHttpRequestObject();
		if (XMLHttpRequestObject) {
			XMLHttpRequestObject.open("POST", dataSource, true);
			XMLHttpRequestObject.onreadystatechange = function () {
				try {
					alert(XMLHttpRequestObject.status);
					if (XMLHttpRequestObject.readyState == 4 && XMLHttpRequestObject.status == 200) {
						var xmlDocument = XMLHttpRequestObject.responseXML;
						options = xmlDocument.getElementsByTagName("option");
						listOptions(options, optionList);
					}
				}
				catch (e) {
					alert(e);
				}
			};
			XMLHttpRequestObject.send(null);
		}
	}
	catch (e) {
		alert(e);
	}
}
function listOptions(options, optionList) {
	var loopIndex;
	var selectControl = document.getElementById(optionList);
	for (loopIndex = 0; loopIndex < options.length; loopIndex = loopIndex + 1) {
		try {
			var a = new Option(options[loopIndex].firstChild.data);
			selectControl.options[loopIndex] = a;
		}
		catch (ex) {
			alert(ex);
		}
	}
}
function getSuggest(keyEvent, path) {
	//test whether keyEvent has a non-zero value (window.event object instead in the Internet Explorer.)
	keyEvent = (keyEvent) ? keyEvent : window.event;
	/*You can also determine which control the user was typing into, but that
	depends on which browser the user has. In the Internet Explorer, you use the
	srcElement property of the keyEvent object, but otherwise, you use the
	target property to get the control the user was typing into:
	*/
	input = (keyEvent.target) ? keyEvent.target : keyEvent.srcElement;
	if (keyEvent.type == "keyup") {
		if (input.value) {
			getData(path + "/album.do?method=getGoogleSearch&qu=" + input.value);
		} else {
			var targetDiv = document.getElementById("targetDiv3");
			targetDiv.innerHTML = "<div></div>";
		}
	}
}
function getData(dataSource) {
	var XMLHttpRequestObject = getXMLHttpRequestObject();
	if (XMLHttpRequestObject) {
		XMLHttpRequestObject.open("GET", dataSource);
		XMLHttpRequestObject.onreadystatechange = function () {
			if (XMLHttpRequestObject.readyState == 4 && XMLHttpRequestObject.status == 200) {
				eval(XMLHttpRequestObject.responseText);
			}
		};
		XMLHttpRequestObject.send(null);
	}
}
function getXMLForErrors(dataSource) {
	try {
		var options;
		var isValid = true;
		var XMLHttpRequestObject = getXMLHttpRequestObject();
		if (XMLHttpRequestObject) {
			XMLHttpRequestObject.open("GET", dataSource);
			XMLHttpRequestObject.onreadystatechange = function () {
				if (XMLHttpRequestObject.readyState == 4 && XMLHttpRequestObject.status == 200) {
					var xmlDocument = XMLHttpRequestObject.responseXML;
					options = xmlDocument.getElementsByTagName("pageerrors");
					isValid = showErrors(options);
				}
			};
			XMLHttpRequestObject.send(null);
		}
	}
	catch (e) {
		alert(e);
	}
	alert("3" + isValid);
	return isValid;
}
function showErrors(options) {
	var loopIndex;
	if (options.length = 1) {
		var str = options[0].firstChild.data;
		if (str == "" || str == " ") {
			alert("1-true");
			return true;
		}
	}
	for (loopIndex = 0; loopIndex < options.length; loopIndex = loopIndex + 1) {
		try {
			var str = options[loopIndex].firstChild.data;
			showSplit(str);
		}
		catch (ex) {
			alert(ex);
		}
	}
	return false;
}
function showSplit(str) {
	var splStr = str.split("--");
	var loopIndex = 0;
	while (splStr[loopIndex] != undefined) {
		try {
			var message = splStr[loopIndex];
			if (message != "" && message != " ") {
				var splMsg = splStr[loopIndex].split("-");
				var ele = document.getElementById(splMsg[0] + "error");
				ele.innerHTML = "*" + splMsg[1];
				ele.style.display = "inline";
				ele.style.fontSize = 12 + "px";
				ele.style.color = "red";
			}
		}
		catch (ex) {
		}
		loopIndex = loopIndex + 1;
	}
}
function checkEmail(emailField) {
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var emailString = emailField.value;
	if (!filter.test(emailString)) {
		alert("Please provide a valid email address");
		emailField.focus;
		return false;
	}
}
function getHeadData(dataSource, divID) {
	var XMLHttpRequestObject = getXMLHttpRequestObject();
	if (XMLHttpRequestObject) {
		try {
			var obj = document.getElementById(divID);
			XMLHttpRequestObject.open("HEAD", dataSource);
			XMLHttpRequestObject.onreadystatechange = function () {
				if (XMLHttpRequestObject.readyState == 4 && XMLHttpRequestObject.status == 200) {
					obj.innerHTML = XMLHttpRequestObject.getAllResponseHeaders();
					//var date = new Date(XMLHttpRequestObject.getResponseHeader("Last-Modified"));
				} else {
					if (XMLHttpRequestObject.status == 404) {
						alert("URL doesnot exists");
					}
				}
			};
		}
		catch (ex) {
			alert(ex);
		}
	}
	XMLHttpRequestObject.send(null);
}
function dateFunction(date) {
	alert("Day (1-31): " + date.getDate());
	alert("Weekday (0-6, 0 = Sunday): " + date.getDay());
	alert("Month (0-11): " + date.getMonth());
	alert("Year (0-99-31): " + date.getYear());
	alert("Full year (four digits): " + date.getFullYear());
	alert("Day (1-31): " + date.getDate());
	alert("Day (1-31): " + date.getDate());
	alert("Hour (0-23): " + date.getHours());
	alert("Minutes (0-59): " + date.getMinutes());
	alert("Seconds (0-59): " + date.getSeconds());
}

