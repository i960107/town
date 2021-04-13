<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@include file="./../common/main_top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 거래 채팅</title>
<script type="text/javascript" src="<%=source%>">
	
</script>
</head>
<body>
<div>
<c:forEach var="chat" items="cList">
	
</c:forEach>
</div>
<form action="reply.prd">
	<textarea rows="5" cols="20"></textarea>
	<input type="submit" value="보내기">
</form>
</body>
<%@include file="./../common/main_bottom.jsp" %>
</html>