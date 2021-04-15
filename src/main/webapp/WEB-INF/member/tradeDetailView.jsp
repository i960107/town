<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- MTradeDetailController >> -->
<title>판매자 : ${mbean.id } 정보보기</title>
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

@-webkit-keyframes animate-positive {
 0% { width: 0%;}
}
@keyframes animate-positive{ 
0% {width: 0%;}
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
	flex-direction: row;
	justify-content: center;
}

#pList, #bList {
	flex-wrap: wrap;
	width: 70%;
	justify-content: center;
	align-items: flex-start;
}

.flex-container-column {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
}

#mylist {
	align-items: center;
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
<%@ include file="./../common/main_top.jsp"%>
	<div class="flex-container">
		<div class="flex-container-row" style="width: 70%">
			<!-- 사진과 이이디 -->
			<div>
				<div class="box ">
					<c:if test="${mbean.sitestatus==0 }">
						<img class="profile"
							src="<%=request.getContextPath()%>/resources/members/${mbean.image}">
					</c:if>
					<c:if test="${mbean.sitestatus==1 }">
						<img class="profile"
							src="${mbean.image}">
					</c:if>
				</div>
				<div>
					<b><font size="10px">${mbean.id}</font></b> 님의 정보
				</div>
			</div>
			<!-- 매너온도 -->
			<div class=" flex-container-column">
				<div>${mbean.address}</div>
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
		<section class="latest-blog spad">
			<div id="mylist" class="flex-container-column">
				<div class="section-title">
					<h2>
						<span onmouseover="style='cursor:pointer'" onclick="callPlist()"
							class="list-table">판매 상품 목록</span> / <span onclick="callBlist()"
							onmouseover="style='cursor:pointer'" class="list-table">동네생활 게시글
							목록</span>
					</h2>
				</div>
				<div id="pList" class="flex-container-row">
					<!-- 판매상품 리스트 이미지 -->
					<c:forEach var="i" items="${pList}">
						<div style="padding: 15px;">
							<a href="detail.prd?no=${i.no }&sellerid=${i.sellerid}"> <img
								src="<%=request.getContextPath()%>/resources/${i.image1}"
								height="200" width="200">
							</a> <br> <span class="list-font"> ${i.subject }</span> <br>
							<span class="list-font"> 가격 : ${i.price } 원</span><br> <span
								class="list-font"> &#128065; : ${i.readcount }</span> <br>
							<span class="list-font"> 작성일 : <fmt:parseDate
									value=" ${i.regdate}" var="regDateParsed"
									pattern="yyyy-MM-dd HH:mm:ss.s" /> <fmt:formatDate
									value="${regDateParsed}" pattern="yyyy-MM-dd"
									var="regDateFormatted" /> ${regDateFormatted }
							</span><br> <span> <c:if test="${i.dealstatus==1}">판매중</c:if>
								<c:if test="${i.dealstatus==0}">판매완료</c:if>
							</span>
						</div>
					</c:forEach>
				</div>
				<div id="bList" class="flex-container-column">
					<!-- 내가 쓴 동네생활글-->
					<div style="padding: 15px;">
						<h3>동네생활</h3>
						<table class="table">
							<tr>
								<td>원글 번호</td>
								<td>제목</td>
								<td>내용</td>
								<td>조회수</td>
								<td>작성일</td>
							</tr>
							<c:forEach var="i" items="${bList}">
								<tr>
									<a href="detailView.bd?no=${i.ref}">
										<td>${i.no}</td>
										<td>${i.subject}</td>
										<td>${fn:substring(i.contents,0,20)}</td>
										<td>${i.regDate}</td>
										<td>${i.readcount}</td>
									</a>
								</tr>
							</c:forEach>
						</table>
					</div>
			
					<!-- 내가쓴 동네생활 댓글 -->
					<div style="padding: 15px;">
						<h3>동네생활 댓글</h3>
						<table class="table">
							<c:forEach var="i" items="${rList}">
								<tr>
									<td>원글 번호</td>
									<td>내용</td>
									<td>작성일</td>
								</tr>
								<tr>
									<a href="detailView.bd?no=${i.ref}">
									<td>${i.ref}</td>
									<td>${fn:substring(i.contents,0,20)}</td>
									<td>${i.regDate}</td>
									</a>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</section>
	</div>
<%@ include file="./../common/main_bottom.jsp"%>
</body>
</html>
