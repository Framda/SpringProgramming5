<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
</head>
<body style="padding: 30px">

<h4>Post</h4>
<form>
	<div class="form-group">
		<label for="bno">No</label> 
		<input id="bno" name="bno" type="text" class="form-control" value="${board.bno}" readonly>
	</div>
	<div class="form-group">
		<label for="btitle">Title</label> 
		<input id="btitle" name="btitle" type="text" class="form-control" value="${board.btitle}" readonly>
	</div>
	<div class="form-group">
		<label for="bwriter">writer</label> 
		<input id="bwriter" name="bwriter" type="text" class="form-control" value="${board.bwriter}" readonly>
	</div>
	<div class="form-group">
		<label for="bhitcount">Views</label> 
		<input id="bhitcount" name="bhitcount" type="text" class="form-control" value="${board.bhitcount}" readonly>
	</div>
	<div class="form-group">
		<label for="bdate">Date</label> 
		<input id="bdate" name="bdate" type="text" class="form-control"
		value="<fmt:formatDate value="${board.bdate}" pattern="yyyy.MM.dd"/>" readonly>
	</div>
	<div class="form-group">
		<label for="bcontent">Content</label>
		<textarea id="bcontent" name="bcontent" class="form-control" rows="8" readonly>${board.bcontent}</textarea>
	</div>
</form>
	<a href="boardList?pageNo=${pageNo}" class="btn btn-info">Prev</a>
<c:if test="${board.bwriter == mid}">
	<a href="updateBoard?bno=${board.bno}" class="btn btn-info">Update</a>
	<a href="deleteBoard?bno=${board.bno}" class="btn btn-danger">Delete</a>
</c:if>
</body>
</html>