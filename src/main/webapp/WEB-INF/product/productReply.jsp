<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%-- <%@include file="./../common/main_top.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sbean.id } 거래 채팅</title>
<%-- <script type="text/javascript" src="<%=source%>">
	
</script> --%>

<style>
	.div-style{
		width: auto;
		height: auto;
		border: 5px solid #FFC19E;
		border-radius: 10%;
		align-content: center;		
	}
	img{
		margin-left: auto;
		margin-right: auto;
		display: block;
	}
	.chat-div{
		width: auto;
		height: auto;
	}

</style>

</head>
<body>


<br>
<img src="<%=request.getContextPath()%>/resources/img/logo.png" >
<br>
<div class="div-style">
<table align="center">
	<tr>
		<td>
		
			<div class="chat-div">
			<c:forEach var="chat" items="${clist }">
			<c:if test="${login==chat.talker }">
			<p align="right" >${chat.contents }</p>
			</c:if>
			<c:if test="${login!=chat.talker }">
			<p align="left" >${chat.contents }</p>
			</c:if>
			</c:forEach>
			</div>
			
		</td>
	</tr>
</table>
<form action="reply.prd" method="post" name="myform">
	<input type="hidden" name="sellerid" value="${sbean.id }">
	<input type="hidden" name="buyerid" value="${bbean.id }">
	<input type="hidden" name="pno" value="${pno }">
	<input type="hidden" name="room" value="${room }">
	<input type="hidden" name="subject" value="${pbean.subject }">
	<input type="hidden" name="talker" value="${login }">
	<table align="center">
	<tr>
	<td>
	<textarea rows="4" cols="50" name="contents" ></textarea></td>
	<td><input type="submit" value="전송"></td>
	</tr>
	<tr align="center">
	<td colspan="2" > 
		<br>
		<input type="button" onclick="self.close()" value="대화창 닫기" >
	
	</td>
	</tr>
	</table>
		<br>
</form>
</div>

</body>
<%-- <%@include file="./../common/main_bottom.jsp" %> --%>
</html>