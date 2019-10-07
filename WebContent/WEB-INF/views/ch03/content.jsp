<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<h4>[RequestMapping]</h4>
	<br>
	<p>
		<a href="join?mid=fall&mname=홍길동&mpassword=12345&mage=25&&mbirth=1994-12-25"
			class="btn btn-primary">Get Type Test</a>
	</p>
	<p>
	
	<form method="post" action="join2">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">ID</span>
			</div>
			<input name="mid" value="fall" type="text" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">name</span>
			</div>
			<input name="mname" value="이민호" type="text" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">password</span>
			</div>
			<input name="mpassword" value="1234" type="password" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">age</span>
			</div>
			<input name="mage" value="20" type="number" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">birth</span>
			</div>
			<input name="mbirth" value="1994-12-25" type="date" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<input type="submit" value="Sign in" class="btn btn-danger">
	</form>
	</p>
	<p>
		<a href="join2?mid=fall&mname=홍길동&mpassword=12345&mage=25&&mbirth=1994-12-25"
			class="btn btn-primary">Get object Type Test</a>
	</p>
</body>
</html>