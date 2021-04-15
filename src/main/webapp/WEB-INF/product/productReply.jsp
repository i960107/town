<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@include file="./../common/main_top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sbean.id } 거래 채팅</title>
<script type="text/javascript" src="<%=source%>">
	
</script>
</head>
<body>
<table align="center">
	<tr>
		<td>
			<div>
			<c:forEach var="chat" items="${clist }">
			<c:set value="align='left'" var="chater"/>
			<c:if test="${chat.sellerid==sbean.id }">
			<c:set value="align='right'" var="chater"/>
			</c:if>
			<c:if test="${chat.buyerid==bbean.id }">
			<c:set value="align='right'" var="chater"/>
			</c:if>
				<p ${chater }>${chat.contents }</p>
			</c:forEach>
			</div>
		</td>
	</tr>
</table>
<form action="reply.prd" method="post" name="myform">
	<input type="hidden" name="sellerid" value="${sbean.id }">
	<input type="hidden" name="buyerid" value="${bbean.id }">
	<input type="hidden" name="pno" value="${pno }">
	<textarea rows="5" cols="20" name="contents"></textarea>
	<input type="submit" value="전송">
</form>
</body>
<%@include file="./../common/main_bottom.jsp" %>
</html>