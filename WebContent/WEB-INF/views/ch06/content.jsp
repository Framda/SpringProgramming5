<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function btnLogin() {
		if($("#mid").val() == "") return false;
		if($("#mpassword").val() == "") return false;
		return true;
	}
	function btnLogout() {
		location.href = "logout";
	}
</script>

</head>
<body>
<h5>[content.jsp]</h5>
<div>
	<c:if test="${loginResult != 'success'}">
		<form id="loginForm" method="post" action="login">
			<div class="form-group">
				<label for="mid">ID</label>
				<input type="text" class="form-control" id="mid" name="mid">
				<c:if test="${loginResult == 'wrongMid'}">
				<span style="color:red;font-weight: 700;">Incorrect username</span>
				</c:if>
			</div>
			<div class="form-group">
				<label for="mpassword">Password</label>
				<input type="password" class="form-control" id="mpassword" name="mpassword">
				<c:if test="${loginResult == 'wrongMpassword'}">
				<span style="color:red;font-weight: 700;">Incorrect password.</span>
				</c:if>
			</div>
			<input type="submit" onclick="return btnLogin()" class="btn btn-primary" value="Log in"/>
		</form>
	</c:if>
	
	<c:if test="${loginResult == 'success'}">
		<div id="logoutDiv">
			<button onclick="btnLogout()" class="btn btn-danger">Log out</button>
		</div>
	</c:if>
</div>
</body>
</html>