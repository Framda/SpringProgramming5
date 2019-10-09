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
		<a href="join2?mid=fall&mname=홍길동&mpassword=12345&mage=25&&mbirth=1994-12-25"
			class="btn btn-primary">Get Object Type Test</a>
	</p>
	<p>
	
	<form id="joinForm" name="joinForm" method="post" action="join2">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">ID</span>
			</div>
			<input id="mid" name="mid" value="fall" type="text" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">name</span>
			</div>
			<input id="mname" name="mname" value="이민호" type="text" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">password</span>
			</div>
			<input id="mpassword" name="mpassword" value="1234" type="password" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">age</span>
			</div>
			<input id="mage" name="mage" value="20" type="number" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">birth</span>
			</div>
			<input id="mbirth" name="mbirth" value="1994-12-25" type="date" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<input type="submit" value="Sign in" class="btn btn-danger">
	</form>
	</p>
	
	<p>
	</p>
	
	<p>
		<script type="text/javascript">
			function join() {
				//유효성검사
				if(mid == "") return;
				
				//how 1
				/* var mid = $("#mid").val();
				var mname = $("#mname").val();
				var mpassword = $("#mpassword").val();
				var mage = $("#mage").val();
				var mbirth = $("#mbirth").val();
				var params = "";
				params += "mid=" + mid + "&";
				params += "mname" + mname + "&";
				params += "mpassword=" + mpassword + "&";
				params += "mage=" + mage + "&";
				params += "mbirth=" + mbirth; 
				
				location.href = "join2?" + params;*/
				
				//how2
				//var joinForm = document.querySelectoy("#joinForm");
				//joinForm.submit();
				
				//how3
				//name을 joinForm으로 정의해야함
				document.joinForm.submit();
				
			}
		</script>
		<button onclick="join()" class="btn btn-danger">Request by JavaScript</button>
	</p>
	
	<p>
		<script type="text/javascript">
			function joinAjax() {
				$.ajax({
					url: "join3",
					//data: "mid=fall&mname=감자바", 전송할 data를 문자열로도 쓸 수 있다.
					data: {mid: "fall", mname: "감자바"},
					//method의 value를 post로 하면 request의 바디행에 넣어 data를 전달할 수 있으며 이를위해 data를 따로객체를 생성했다.
					method: "post",
					success: function(data) {
						var html = "<span>mid: " + data.mid + "</span> <br>";
						html += "<span>mname: " + data.mname + "</span>";
						$("#resultDiv").html(html);
					}
				});
			}
		</script>
		<button onclick="joinAjax()" class="btn btn-danger">Request by AJAX</button>
		<div id="resultDiv">
		</div>
	</p>
	
	
	
	
	
	
	
	
	
</body>
</html>















