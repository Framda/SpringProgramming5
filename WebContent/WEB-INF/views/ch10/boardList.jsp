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
<body style="padding-right: 300px">
	<h4>Post list</h4>
	<table class="table table-sm">
		<thead style="background-color: #D32; height: 30px; border-bottom: 3px dotted red;">
			<tr>
				<th scope="col">Number</th>
				<th scope="col">Title</th>
				<th scope="col">Writer</th>
				<th scope="col">Date</th>
				<th scope="col">view</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${boardList}" var="board">
				<tr>
					<th scope="row">${board.bno}</th>
					<td><a href="boardDetail?bno=${board.bno}">${board.btitle}</a></td>
					<td>${board.bwriter}</td>
					<td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" /></td>
					<td>${board.bhitcount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="display: flex;">
		<div style="flex-grow: 1;">
			<a href="boardList?pageNo=1" class="btn btn-primary">first</a>
			
			<c:if test="${groupNo>1}">
				<a href="boardList?pageNo=${startPageNo-1}" class="btn btn-success">prev</a>
			</c:if>
			
			<div style="display: inline-block;" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
				<div class="btn-group mr-2" role="group" aria-label="First group">
					<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
						<c:if test="${pageNo==i}">
							<a href="boardList?pageNo=${i}" class="btn btn-secondary active">${i}</a>
						</c:if>
						<c:if test="${pageNo!=i}">
							<a href="boardList?pageNo=${i}" class="btn btn-secondary">${i}</a>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<c:if test="${pageNo<totalPageNum}">
				<a href="boardList?pageNo=${endPageNo+1}" class="btn btn-success">next</a>
			</c:if>
			<a href="boardList?pageNo=${totalPageNum}" class="btn btn-primary">end</a>
		</div>
		<div>
			<a href="writeBoardForm" class="btn btn-primary">write</a>
			<c:if test="${mid==null}">
				<a href="loginForm" class="btn btn-info">Sign in</a>
				<a href="join" class="btn btn-info">Sign up</a>
			</c:if>
			<c:if test="${mid!=null}">
				<a href="logout" class="btn btn-danger">Sign out</a>
			</c:if>
		</div>
	</div>
</body>
</html>






















