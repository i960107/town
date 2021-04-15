<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@ include file="./../common/main_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 리스트</title>
</head>
<body>
<table align="center">
	<c:forEach var="chat" items="${clist }">
	<tr>
		<td>
		
		</td>
	</tr>
	</c:forEach>
</table>
</body>
<%@include file="./../common/main_bottom.jsp" %>
</html>