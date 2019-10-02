<%@ page contentType="text/html;charset=UTF-8"%>
<%--<%request.setCharacterEncoding("UTF-8"); %>--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>

<style>
	a {
		color: blue;
	}
	* {
		color: #000;
		text-decoration: none;
        margin: 0;
	}
    li {
        font-size: 18px;
        margin-top: 8px;
    }
	body {
		background-color: rgba(0, 0, 0, .03);
		margin: 0;
		width: 100%;
        font-family: 'Big Shoulders Display', cursive;
        font-size: 24px;
	}
	#wrap {
		width: 100%;
		height: 100vh;
		display: flex;
		flex-direction: column;
	}
	#header {
		text-align: center;
		border-bottom: 1px solid #000;
		height: 70px;
        line-height: 70px;
        background-color: rgba(0, 0, 0, 0.05);
	}
	#content {
		display: flex;
		flex-grow: 1;
		min-height: 0;
	}
	#sideBar {
		overflow-y: scroll;
		width: 300px;
		border-right: 1px solid #000;
        background-color: rgba(0, 0, 0, 0.15);
	}
	#center {
		flex-grow: 1;
		background-color: rgba(0, 0, 0, .05);
	}
	#center iframe {
		margin: 0;
		width: 100%;
		height: 100%;
		padding: 0;
		margin: 0;
		border: none;
	}
	#footer {
		border-top: 1px solid #000;
		height: 50px;
		line-height: 50px;
		text-align: center;
		font-size: 12px;
		color: #999;
        background-color: rgba(0, 0, 0, 0.05);
	}
	#footer a {
		color: deepskyblue;
	}
</style>
<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800&display=swap" rel="stylesheet">
</head>
<body>
<div id="wrap">
	<div id="header"><h3><a href="/SpringProgramming2">Spring Programming2</a></h3></div>
	<div id="content">
		<div id="sideBar">
			<ol>
				<p>Request Mapping</p>
				<li><a href="info" target="iframe">Request Mapping1</a></li>
			</ol>
		</div>
		<div id="center">
			<iframe name="iframe" src="http://tomcat.apache.org"></iframe>
		</div>
	</div>
	<div id="footer">&copy;copyright 2019 . <a href="https://github.com/Framda" target="_blank">Framda</a> </div>
</div>
</body>
</html>