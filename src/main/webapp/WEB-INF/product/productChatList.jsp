<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@ include file="./../common/main_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 리스트</title>
<script>
	function chat(pno, sellerid, buyerid) {
		window.open("reply.prd?no="+pno+"&sellerid="+sellerid+"&buyerid="+buyerid+"", "구매연락하기", "width=650, height=700, left=100, top=50");
	}
</script>
</head>
<body>
<table align="center">
	<h2>채팅 리스트</h2>
	<c:forEach var="chat" items="${clist }">
	<tr>
		<td>
		<span><a onclick="chat('${chat.pno }', '${chat.sellerid}', '${chat.buyerid}')" style="cursor: pointer;">${chat.subject }</a></span>
		</td>
		<td>
		<span>${chat.sellerid }</span>
		</td>
		<td>
		<span>${chat.buyerid }</span>
		</td>
		<td>
		<span>${chat.contents }</span>
		</td>
	</tr>
	</c:forEach>
</table>
</body>
<%@include file="./../common/main_bottom.jsp" %>
</html>