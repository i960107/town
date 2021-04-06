<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@ include file="./../../WEB-INF/member/memberMyPageTop.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<!-- PWriteController > -->
</head>
<body>
거래 상품 등록
<form:form action="write.prd" method="post">
	<table>
		<tr>
		<td>제목</td>
		<td><input type="text" name="subject" ></td>
		
		</tr>
		<tr>
		<td>주소</td>
		<td></td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="완료"> </td>
		</tr>
	</table>
</form:form>
</body>
</html>