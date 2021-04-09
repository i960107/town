<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@ include file="./../common/main_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- MTradeDetailController >> -->
</head>
<body>
<table style="height: 310px;">
	<tr>
		<td>
		<img alt="" src="<%=source%>/resources/members/${mBean.image}" width="310px" height="310">
		</td>
		<td>
		<table style="width: 710px;">
			<tr>
			<td>
			<span>${mBean.id }</span>
			</td>
			</tr>
			<tr>
			<td>
			<span>${mBean.address }</span>
			</td>
			</tr>
			<tr>
			<td>
			${mtemp }
			</td>
			</tr>
			<tr>
			<td>
			</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<a href="tradeReview"></a>
</body>
</html>