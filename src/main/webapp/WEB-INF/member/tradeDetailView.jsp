<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@ include file="./../../WEB-INF/member/memberMyPageTop.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- MTradeDetailController >> -->
</head>
<body>
사용자 정보 확인${mBean.id} <br>
주소 ${mBean.address } <br>
<<<<<<< HEAD
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
=======
>>>>>>> e9d7a7987d85bc9427b96d694d509f552e59b28d
<a href="tradeReview"></a>
</body>
</html>