<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@ include file="./../common/main_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 : ${mBean.id } 정보보기</title>
<!-- MTradeDetailController >> -->
</head>
<body>
<table style="height: 310px;" align="center">
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

<a href="tradeReview.mb">거래후기</a>
</body>
</html>