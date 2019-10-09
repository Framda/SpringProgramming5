<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.dto.*" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%List<Ch05Board> boardList = (List<Ch05Board>)request.getAttribute("boardList");%>
<h5>Post list(Total: ${totalNo})</h5>
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
		<c:forEach items="${boardList}" var="board">
			<tr>
				<th scope="row">${board.bno}</th>
				<td>${board.btitle}</td>
				<td>${board.writer}</td>
				<td><fmt:formatDate value="${board.date}" pattern="yyyy-MM-dd" /></td>
				<td>${board.hitcount}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>