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
}
.list-table{
	cursor: pointer;
}
.list-font{
	font-size: 15px;
	font-weight: bold; 
	color: #A0A0A0;
}
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript">
$(function () {
	 $("#pList").hide();
	 $("#bList").hide();
	});
function callPlist() {
	$("#pList").show();
	$("#bList").hide();
}
function callBlist() {
	$("#pList").hide();
	$("#bList").show();
}
</script>
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
					<!-- 판매자 아이디 -->
					<span>${mBean.id }</span>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 판매자 주소 -->
					<span>${mBean.address }</span>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 판매상품 갯수 -->
					<span>판매상품  : ${fn:length(pList) }</span>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 매너 평가 이동 -->
					<span class="active" style="clear: none;"><a href="tradeReview.mb">매너평가하기</a></span>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 매너온도계 -->
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
		</table>
		</td>
	</tr>
</table>
<table align="center" style="width: 720px;">
	<tr>
		<td colspan="4">
			<span onclick="callPlist()" class="list-table">상품 판매리스트</span>
			<span onclick="callBlist()" class="list-table">동네생활 게시글 리스트</span>
		</td>
	</tr>
	<tr id="pList">
		<!-- 판매상품 리스트 이미지 -->
		<c:set var="step" value="0"/>
		<c:forEach var="i" items="${pList }">
		<c:set var="step" value="${step+1 }"/>
		<td style="padding: 15px;">
				<a href="detail.prd?no=${i.no }&sellerid=${i.sellerid}">
				<img alt="" src="<%=request.getContextPath()%>/resources/${i.image1}" height="200" width="200"><br>
				</a>
				<span class="list-font"> ${i.subject }</span> <br>
				<span class="list-font"> 가격 : ${i.price } 원</span><br>
				<span class="list-font"> &#128065; : ${i.readcount }</span> <br>
				<span class="list-font"> 작성일 : 
				<fmt:parseDate value=" ${i.regdate}" var="regDateParsed" pattern="yyyy-MM-dd HH:mm:ss.s" />
				<fmt:formatDate value="${regDateParsed}" pattern="yyyy-mm-dd" var="regDateFormatted" />
				${regDateFormatted }
				</span>
				</span><br>
				<c:if test="${(step%4)==0 }"></tr><tr></c:if>
		</td>
		</c:forEach>
	</tr>
	<tr id="bList">
		<!-- 동네 생활 게시글 리스트 이미지 -->
		<c:set var="step" value="0"/>
		<c:forEach var="i" items="${bList }">
		<c:set var="step" value="${step+1 }"/>
		<td style="padding: 15px;">
				<a href="detailView.bd?no=${i.no }">
				<span class="list-font">${i.subject }</span> <br>
				</a>
				<span class="list-font">&#128065; : ${i.readcount }</span><br>
				<span class="list-font">작성일 : 
				<fmt:parseDate value=" ${i.regDate}" var="regDateParsed" pattern="yyyy-MM-dd HH:mm:ss.s" />
				<fmt:formatDate value="${regDateParsed}" pattern="yyyy-mm-dd" var="regDateFormatted" />
				${regDateFormatted }
				</span><br>
				<span>${i.contents }</span>
				<c:if test="${(step%4)==0 }"></tr><tr></c:if>
		</td>
		</c:forEach>
	</tr>
</table>
</body>
</html>