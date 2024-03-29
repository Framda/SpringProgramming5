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
		//입력값 검사
		if($("#btitle").val()=="") {
			$("#btitleError").text("Enter title");
			result = false;
		}
		if($("#bcontent").val()=="") {
			$("#bcontentError").text("Enter content");
			result = false;
		}
		return result;
	}
</script>
</head>
<body style="padding: 30px">

<h4>Post Update</h4>
<form method="post" action="updateBoard" onsubmit="return checkForm()">
	<input type="hidden" name="bno" value="${board.bno}" />
	<div class="form-group">
		<label for="btitle">Title</label> 
		<input id="btitle" name="btitle" value="${board.btitle}" type="text" class="form-control" placeholder="Write Title">
		<span id="btitleError" class="error" style="color: red"></span>
	</div>
	<div class="form-group">
		<label for="bcontent">Content</label>
		<textarea id="bcontent" name="bcontent" class="form-control" rows="8" placeholder="Write Content">${board.bcontent}</textarea>
		<span id="bcontentError" class="error" style="color: red"></span>
	</div>
	<div class="form-group">
		<input type="submit" value="update" class="btn btn-danger"/>
	</div>
</form>
</body>
</html>