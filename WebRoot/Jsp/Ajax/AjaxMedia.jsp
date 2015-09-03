<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
%>
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<script type="text/javascript"
			src="<%=path%>/Jsp/Scripts/jquery.jplayer.min.js"></script>
		<script type="text/javascript"
			src="<%=path%>/Jsp/Scripts/jquery.jplayer.inspector.js"></script>
		<script type="text/javascript"
			src="<%=path%>/Jsp/Scripts/jplayer.playlist.min.js"></script>
		<script type="text/javascript"
			src="<%=path%>/Jsp/Scripts/popcorn.jplayer.js"></script>

		<script type="text/javascript">
$(document).ready(function(){
$("#jquery_jplayer_1").jPlayer({
ready: function () {
$(this).jPlayer("setMedia", {
m4a: "/media/Dil Chahta Hai.MP3",
oga: "/media/mysound.ogg"
});
},
swfPath: "/js",
supplied: "m4a, oga"
});
});
</script>
		<style type="">
.div.audio-player {
	
}

.audio-player {
	position: relative;
	width: 400px;
	height: 120px;
	background: -moz-linear-gradient(center top, rgb(76, 78, 90) 0%,
		rgb(44, 45, 51) 100% ) repeat scroll 0% 0% transparent;
	border-radius: 3px 3px 3px 3px;
	margin: 0px auto;
}

.audio-player h1 {
	position: absolute;
	top: 37px;
	left: 165px;
	font-family: Helvetica, Arial, sans-serif;
	font-weight: bold;
	font-size: 14px;
	color: rgb(236, 236, 236);
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
}

.mep_0 {
	margin: 0px;
	padding: 0px;
	border: medium none;
	outline: medium none;
}

.mejs-play button {
	width: 21px;
	height: 21px;
	top: 35px;
	left: 135px;
	background: url("../Img/play-pause.png") repeat scroll 0px 0px
		transparent;
}
</style>
	</head>
	<body>
		<div id="jquery_jplayer_1"></div>
		<div id="jp_container_1">
			<a href="http:<%=path%>/media/Dil Chahta Hai.MP3" class="jp-play">Play</a>
			<a href="#" class="jp-pause">Pause</a>
			<audio id="jp_audio_0" preload="metadata"
				src="http:<%=path%>/media/Dil Chahta Hai.MP3"></audio>
		</div>

		<div class="audio-player">
			<h1>
				Demo - Preview Song
			</h1>
			<img class="cover" alt="" src="img/cover.png"></img>
			<div id="mep_0" class="mejs-container mejs-audio"
				style="width: 400px; height: 120px;">
				<div class="mejs-inner">
					<div class="mejs-mediaelement">
						<audio id="audio-player" type="audio/mp3" src="media/demo.mp3"></audio>
					</div>
					<div class="mejs-layers">
						<div class="mejs-poster mejs-layer"
							style="display: none; width: 400px; height: 120px;"></div>
					</div>
					<div class="mejs-controls">
						<div class="mejs-button mejs-playpause-button mejs-play">
							<button title="Play/Pause" aria-controls="mep_0" type="button"></button>
						</div>
						<div class="mejs-button mejs-volume-button mejs-mute">
							<button title="Mute Toggle" aria-controls="mep_0" type="button"></button>
						</div>
						<div class="mejs-horizontal-volume-slider mejs-mute">
							<div class="mejs-horizontal-volume-total"></div>
							<div class="mejs-horizontal-volume-current" style="width: 200px;"></div>
							<div class="mejs-horizontal-volume-handle" style="left: 194px;"></div>
						</div>
						<div class="mejs-time-rail" style="">
							<span class="mejs-time-total" style=""> </span>
						</div>
					</div>
					<div class="mejs-clear"></div>
				</div>
			</div>
		</div>
	</body>
</html>