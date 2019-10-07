<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<h4>[RequestMapping]</h4>
	<br>
	<p><a href="getMethod" class="btn btn-primary">Get Type Test</a></p>
	<p><form method="post" action="postMethod">
			<input type="submit" value="PostMethod" class="btn btn-primary">
		</form></p>
	<p><a href="joinForm" class="btn btn-primary">Sign In Template Request</a></p>
</body>
</html>