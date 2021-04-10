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
<style type="text/css">
.temp-img{
	overflow: hidden;
	margin: auto;
	position: absolute;
}
.temp{
	position: absolute;
	color: #EBEBEB;
	font-weight: bold;
	font-size: 20px;
}
.profile {
	width: 310px;
	height: 310px;
	object-fit: cover;
}
.box {
	width: 250px;
	height: 250px;
	border-radius: 50%;
	overflow: hidden;
	-
}
</style>
</head>
<body>
<table style="height: 310px;" align="center">
	<tr>
		<td>
		<div class="box">
		<img alt="" src="<%=source%>/resources/members/${mBean.image}" class="profile">
		</div>
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
			<span>판매상품  : ${fn:length(pList) }</span>
			</td>
			</tr>
			<tr>
			<td>
			<img alt="" src="<%=source%>/resources/img/temp_bar.png" class="temp-img" width="200" height="30">
			<c:if test="${mtemp<=49.9 }">
			<img alt="" src="<%=source%>/resources/img/temp_orange.png" class="temp-img" width="${mtemp*2 }" height="30">
			</c:if>
			<c:if test="${mtemp>=50 }">
			<img alt="" src="<%=source%>/resources/img/temp_red.png" class="temp-img" width="${mtemp*2 }" height="30">
			</c:if>
			 <span class="temp">&nbsp;&nbsp; ${mtemp }℃</span>
			</td>
			</tr>
			<tr>
			<td>
			<span><a href="tradeReview.mb">매너평가하기</a></span>
			</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<table align="center">
	<tr>
		<td colspan="4">
		<span><h3>판매 상품 리스트</h3></span>
		</td>
	</tr>
	<tr>
		<c:set var="step" value="0"/>
		<c:forEach var="i" items="${pList }">
		<c:set var="step" value="${step+1 }"/>
		<td>
				<a href="detail.prd?no=${i.no }&sellerid=${i.sellerid}">
				<img alt="" src="<%=request.getContextPath()%>/resources/${i.image1}" height="200" width="200"><br>
				</a>
				<span>${i.subject }</span> <br>
				<span>${i.price }</span> 원 <br>
				<span>${i.regdate }</span><br>
				<c:if test="${(step%4)==0 }"></tr><tr></c:if>
		</td>
		</c:forEach>
	</tr>
</table>
</body>
</html>