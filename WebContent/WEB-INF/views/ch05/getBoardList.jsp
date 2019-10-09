<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.dto.*" %>
<%@ page import="java.util.*"%>

<%List<Ch05Board> boardList = (List<Ch05Board>)request.getAttribute("boardList");%>

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
		<%for(Ch05Board board : boardList) {%>
			<tr>
				<th scope="row"><%=board.getBno()%></th>
				<td><%=board.getBtitle()%></td>
				<td><%=board.getWriter()%></td>
				<td><%=board.getDate()%></td>
				<td><%=board.getHitcount()%></td>
			</tr>
		<%}%>
	</tbody>
</table>