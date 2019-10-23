<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function checkForm() {
		//모든 에러 내용 지우기
		$(".error").text("");
		$(".error").css("color", "red");
		//입력값 검사
		if($("#mid").val()=="") {
			$("#midError").text("Enter username");
			result = false;
		}
		if($("#mname").val()=="") {
			$("#mnameError").text("Enter name");
			result = false;
		}
		if($("#mpassword").val()=="") {
			$("#mpasswordError").text("Enter password");
			result = false;
		}
		return result;
	}
	
	function checkMid() {
		$.ajax({
			url: "checkMid",
			data: {mid: $("#mid").val()},
			success: function(data) {
				if(data.result) {
					$("#midError").text("success");
					$("#midError").css("color", "green");
				} else {
					$("#midError").text("That username is already taken");
					$("#midError").css("color", "red");
				}
			}
		});
	}
</script>
</head>
<body style="padding: 30px">

<img alt="" src="../resources/image/reddit.png" width="50px">
<h4>Sign up</h4>

<form method="post" action="join" onsubmit="return checkForm()" style="width: 500px; margin-bottom: 30px">
	<div class="form-group">
		<label for="mid">ID</label>
		<div class="input-group mb-3">
			<input id="mid" name="mid" type="text" class="form-control" placeholder="CHOOSE A USERNAME">
			<div class="input-group-append">
				<input onclick="checkMid()" type="button" class="btn btn-danger" value="Double Check" />
			</div>
		</div>
		<span id="midError" class="error" style="color: red"></span>
	</div>
	<div class="form-group">
		<label for="mname">NAME</label> 
		<input id="mname" name="mname" type="text" class="form-control" placeholder="NAME">
		<span id="mnameError" class="error" style="color: red"></span>
	</div>
	<div class="form-group">
		<label for="mpassword">Password</label>
		<input id="mpassword" name="mpassword" type="password" class="form-control" placeholder="PASSWORD">
		<span id="mpasswordError" class="error" style="color: red"></span>
	</div>
	<div class="form-group">
		<input type="submit" value="Sign up" class="btn btn-primary"/>
	</div>
</form>
</body>
</html>