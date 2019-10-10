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
	
	function jsonDownload1() {
		$.ajax({
			url: "jsonDownload1",
			success: function(data) {
				var html = "";
				html += "<tr>";
				html += "	<th>"+ data.bno +"</th>"
				html += "	<th>"+ data.btitle +"</th>";
				html += "	<th>"+ data.writer +"</th>";
				html += "	<th>"+ data.date +"</th>";
				html += "	<th>"+ data.hitcount+"</th>";
				html += "</tr>";
				$("tbody").append(html);
			}
		});
	}
	function jsonDownload2() {
		$.ajax({
			url: "jsonDownload2",
			success: function(data) {
				var html = "";
				html += "<tr>";
				html += "	<th>"+ data.bno +"</th>"
				html += "	<th>"+ data.btitle +"</th>";
				html += "	<th>"+ data.writer +"</th>";
				html += "	<th>"+ data.date +"</th>";
				html += "	<th>"+ data.hitcount+"</th>";
				html += "</tr>";
				$("tbody").append(html);
			}
		});
	}
</script>

</head>
<body>
<h5>HttpSession Log in</h5>
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
<br>
<h5>OutputStream Log in</h5>
<div>
	<img src="<%=application.getContextPath()%>/resources/image/Desert.jpg" width="100"/><br><br>
	<img src="fileDownload?fname=Desert.jpg" width="100"/><br><br>
	<a href="fileDownload?fname=Desert.jpg">Download Image File</a>
</div>

<br>
<h5>JSON Data Download Using Writer</h5>
<a href="javascript:jsonDownload1()">Create by JSP</a>
<a href="javascript:jsonDownload2()">Create by Controller</a>
<div id="">
<table class="table table-sm">
	<thead>
		<tr>
			<th scope="col">Number</th>
			<th scope="col">Title</th>
			<th scope="col">Writer</th>
			<th scope="col">Date</th>
			<th scope="col">view</th>
		</tr>
	</thead>
	<tbody>
	
	</tbody>
</table>
</div>
</body>
</html>

























