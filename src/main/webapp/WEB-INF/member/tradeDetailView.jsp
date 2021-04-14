<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@ include file="./../common/main_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- MTradeDetailController >> -->
<title>판매자 : ${mBean.id } 정보보기</title>
<style type="text/css">
.progress-title {
	font-size: 16px;
	font-weight: 700;
	color: #000;
	margin: 0 0 10px 0;
}

.progress {
	height: 20px;
	line-height: 15px;
	border-radius: 20px;
	background: #f0f0f0;
	margin-bottom: 30px;
	box-shadow: none;
	overflow: visible;
	width: 200px;
}

.progress .progress-bar {
	position: relative;
	border-radius: 20px 0 0 20px;
	animation: animate-positive 2s;
}

.progress .progress-value {
	display: block;
	font-size: 13px;
	color: #fff;
	position: absolute;
	top: 0;
	right: 8px;
}

@
-webkit-keyframes animate-positive { 0% {
	width: 0%;
}

}
@
keyframes animate-positive { 0% {
	width: 0%;
}

}
.profile {
	width: 180px;
	height: 180px;
	object-fit: cover;
}

.box {
	width: 200px;
	height: 200px;
	border-radius: 50%;
	overflow: hidden;
}

.flex-container {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.flex-container-row {
	margin-top: 20px;
	display: flex;
	justify-content: center;
}

.flex-container-column {
	display: flex;
	flex-direction: column;
	justify-content: center;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
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
	<div class="flex-container">
		<div class="flex-container-row" style="width: 70%">
			<!-- 사진과 이이디 -->
			<div>
				<div class="box ">
					<img src="<%=source%>/resources/members/${mBean.image}"
						class="profile">
				</div>
				<div>
					<b><font size="10px">${mBean.id}</font></b> 님의 정보
				</div>
			</div>
			<!-- 매너온도 -->
			<div class=" flex-container-column">
				<div>${mBean.address}</div>
				<div>
					<span>판매상품 : ${fn:length(pList) }</span>
				</div>
				<div>
					<h3 class="progress-title">매너온도</h3>
					<div class="progress">
						<!--50도 이상 빨강  -->
						<c:if test="${mtemp>=50}">
							<div class="progress-bar bg-danger" style="width: ${mtemp}%;">
								<div class="progress-value">${mtemp}℃</div>
							</div>
						</c:if>
						<!--36.5도 이상 50도 미만 주황  -->
						<c:if test="${mtemp>=36.5 and mtemp<50}">
							<div class="progress-bar bg-warning" style="width: ${mtemp}%;">
								<div class="progress-value">${mtemp}℃</div>
							</div>
						</c:if>
						<!--36.5도 미만 초록-->
						<c:if test="${mtemp<36.5}">
							<div class="progress-bar" style="width: ${mtemp}%;">
								<div class="progress-value">${mtemp}℃</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="flex-container-column">
			<section class="latest-blog spad">
				<div class="section-title">
					<h2><span onclick="callPlist()"
							class="list-table">상품 판매리스트</span> / <span onclick="callBlist()"
							class="list-table">동네생활 게시글 리스트</span> / </h2>
				</div>
				<div>
				
				<table class="table" align="center">
					<tr id="pList">
						<!-- 판매상품 리스트 이미지 -->
						<c:set var="step" value="0" />
						<c:forEach var="i" items="${pList }">
							<c:set var="step" value="${step+1 }" />
							<td style="padding: 15px;"><a
								href="detail.prd?no=${i.no }&sellerid=${i.sellerid}"> <img
									alt=""
									src="<%=request.getContextPath()%>/resources/${i.image1}"
									height="200" width="200"><br>
							</a> <span class="list-font"> ${i.subject }</span> <br> <span
								class="list-font"> 가격 : ${i.price } 원</span><br> <span
								class="list-font"> &#128065; : ${i.readcount }</span> <br>
								<span class="list-font"> 작성일 : <fmt:parseDate
										value=" ${i.regdate}" var="regDateParsed"
										pattern="yyyy-MM-dd HH:mm:ss.s" /> <fmt:formatDate
										value="${regDateParsed}" pattern="yyyy-mm-dd"
										var="regDateFormatted" /> ${regDateFormatted }
							</span> </span><br> <c:if test="${(step%4)==0 }">
					</tr>
					<tr>
						</c:if>
						</td>
						</c:forEach>
					</tr>
					<tr id="bList">
						<!-- 동네 생활 게시글 리스트 이미지 -->
						<c:set var="step" value="0" />
						<c:forEach var="i" items="${bList }">
							<c:set var="step" value="${step+1 }" />
							<td style="padding: 15px;"><a
								href="detailView.bd?no=${i.no }"> <span class="list-font">${i.subject }</span>
									<br>
							</a> <span class="list-font">&#128065; : ${i.readcount }</span><br>
								<span class="list-font">작성일 : <fmt:parseDate
										value=" ${i.regDate}" var="regDateParsed"
										pattern="yyyy-MM-dd HH:mm:ss.s" /> <fmt:formatDate
										value="${regDateParsed}" pattern="yyyy-mm-dd"
										var="regDateFormatted" /> ${regDateFormatted }
							</span><br> <span>${i.contents }</span> <c:if
									test="${(step%4)==0 }">
					</tr>
					<tr>
						</c:if>
						</td>
						</c:forEach>
					</tr>
				</table>
				</div>
			</section>
		</div>
	</div>
</body>

</html>
