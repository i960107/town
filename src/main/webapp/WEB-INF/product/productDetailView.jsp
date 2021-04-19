<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@ include file="./../common/main_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- PDetailViewControlelr > 
상품 자세히 보기 페이지
 -->
<title>상품 보기</title>
<style type="text/css">
.profile {
	width: 60px;
	height: 60px;
	object-fit: cover;
}

.box {
	width: 50px;
	height: 50px;
	border-radius: 40%;
	overflow: hidden;
}

textarea {
	width: 70%;
	height: 30%;
	padding: 30px;
	box-sizing: border-box;
	border: solid 2px orange;
	border-radius: 7px;
	font-size: 1.2rem;
	resize: none;
}

#carousel-example-generic {
	width: 350px;
	height: 350px;
}

.carousel-item {
	height: 350px;
	width: 350px;
}
</style>
<script type="text/javascript" src="<%=source%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	/* 좋아요 싫어요 함수 호출 */
	function prdLike() {
		location.href = "like.prd?no=${pBean.no}";
	}
	function prdUnLike(liker) {
		location.href = "unlike.prd?no=${pBean.no}&like=" + liker;
	}

	function updateProduct() {
		location.href = "update.prd?no=${pBean.no}";
	}
	function chat() {
		window.open("reply.prd?no=${pBean.no}&sellerid=${pBean.sellerid}",
				"구매연락하기", "width=650, height=700, left=100, top=50");
	}

	/* 신고하기 함수 호출 */
	/* 	function report(sellerid){
	 alert("신고하기 버튼 클릭");
	
	 if(sellerid == loginid){
	 alert("될까....?...");
	 }
	 여기서 아이디 비교하고 똑같으면 location.href=-1;
	 아니면 ....
	 }
	 */
</script>
<script
	src="${pageContext.request.contextPath}/resources/script/timeFormat.js"></script>
<%@include file="prdStyle.jsp"%>

<%
	String loginId = "";
	if (loginInfo != null) {
		loginId = loginInfo.getId();
	}
%>
</head>

<body>
	<div align="center">

		<table>
			<tr>
				<td>
					<!-- 이미지 carousel -->
					<div>
						<div id="carousel-example-generic" class="carousel slide">
							<!-- Indicators(이미지 하단의 동그란것->class="carousel-indicators") -->
							<ol class="carousel-indicators">
								<c:forEach var="item" items="${fileList}" varStatus="i">
									<li data-target="#carousel-example-generic"
										data-slide-to="i.index"
										<c:if test="${i.index==0}">class="active"</c:if>></li>
								</c:forEach>
							</ol>
							<!-- Carousel items -->

							<div class="carousel-inner">
								<c:forEach var="item" items="${fileList}" varStatus="i">
									<div
										class="carousel-item <c:if test="${i.index==0}">active</c:if> set-bg"
										data-setbg="${pageContext.request.contextPath}/resources/${item.filename}">
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</td>
				<td>
					<table style="margin-left: 10px">
						<tr>
							<!-- 상품정보 -->
							<td>
								<table>
									<tr>
									
									<tr height="72"><td colspan="3">
									<c:forTokens items="${pBean.category}" delims=","
												var="ctg">
												<c:forEach begin="0" end="${fn:length(pCategoryList)-1}"
													var="i">
													<c:if test="${pCategoryList[i].no==ctg}">
														<button type="button" class="btn btn-danger"
															style="margin: 10px 5px;">${pCategoryList[i].categoryName}</button>
													</c:if>
												</c:forEach>
											</c:forTokens>
											<br>
										<span class="subject">${pBean.subject }</span></td>
									</tr>
									<tr height="72">
										<td colspan="3"><span class="price"> <fmt:formatNumber
													pattern="###,###">${pBean.price }</fmt:formatNumber> 원
										</span> <br>
											<hr></td>
									</tr>
									<tr>
										<!-- 회원 정보 -->
										<td><a href="tradeDetail.mb?sellerid=${mbean.id }">
												<div class="box">
													<img class="profile"
														src="<%=request.getContextPath()%>/resources/members/${mbean.image}">
												</div>
										</a></td>
										<td valign="top"><a
											href="tradeDetail.mb?sellerid=${mbean.id }"><span
												class="subject">${mbean.id }</span></a></td>
									</tr>
									<tr height="72">
										<!-- 조회수 / 등록일 / 신고 -->
										<td width="40"><span class="mcontent">&#128065;
												${pBean.readcount }</span></td>
										<td width="120"><span class="mcontent"><script>
											document
													.write(displayTime('<c:out value="${pBean.regdate}"/>'));
										</script> </span></td>
										<!-- <td width="120"><input type="button" onclick="report()" value="신고하기"></td> 신고하기 버튼 -->
										<td width="120"><a
											href="report.mb?reporteduserid=${sellerid}"
											onclick="return confirm('이 사용자를 신고하시겠습니까?');"> <span
												class="mcontent">신고하기</span></a></td>

									</tr>
									<tr height="72">
										<td colspan="3" valign="top"><span class="mcontent">거래지역</span>
											<span
											style="font-size: 15px; font-weight: bold; color: #A0A0A0;">
												: ${pBean.address1 } ${pBean.address2 }</span></td>
									</tr>
									<tr>
										<td><c:if test="${pBean.refundavailability==1 }">
												<span
													style="font-size: 15px; font-weight: bold; color: #FF543E;">
													환불불가 </span>
											</c:if> <c:if test="${pBean.refundavailability==0 }">
												<span
													style="font-size: 15px; font-weight: bold; color: #4288F0;">
													환불가능 </span>
											</c:if></td>
										<td><c:if test="${pBean.dealstatus==1 }">
												<span
													style="font-size: 15px; font-weight: bold; color: #4288F0;">
													거래가능 </span>
											</c:if> <c:if test="${pBean.dealstatus==0 }">
												<span
													style="font-size: 15px; font-weight: bold; color: #272727;">
													거래완료 </span>
											</c:if></td>
									</tr>
									<tr height="72">

										<!------------- 좋아요 싫어요 하트 색 / 유동 함수 -------------->
										<td><c:set var="loginId"><%=loginId%></c:set> <c:set
												var="heart" value="&#10084;" /> <c:set var="likecondition"
												value="prdLike()" /> <c:forEach var="i"
												items="${likeList }">
												<c:if test="${loginId==i.userid }">
													<c:set var="heart">&#128151; </c:set>
													<c:set value="${i.no }" var="likeNo" />
													<c:set var="likecondition" value="prdUnLike(${likeNo })" />
												</c:if>
											</c:forEach> <input type="button" name="like"
											value="${heart } 찜 ${likeCnt}" onclick="${likecondition}"
											class="btn_img_like" id="btn_like"></td>
										<!------------- 좋아요 싫어요 하트 색 / 유동 함수 -------------->


										<td>
											<!-- 판매자 = 수정하기 / 구매자 = 연락하기 --> <c:set var="btnType">연락하기</c:set>
											<c:set var="scriptType">chat()</c:set> <c:if
												test="${loginId==pBean.sellerid }">
												<c:set var="btnType">수정하기</c:set>
												<c:set var="scriptType">updateProduct()</c:set>
											</c:if> <input type="button" value="${btnType }"
											onclick="${scriptType}" class="btn_img_nomal">
										</td>
									</tr>

								</table>

							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan=2 height="400" valign="top">
					<hr> <span>${pBean.contents }</span>
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="button"
					style="margin-bottom: 10px" onClick="location.href='saleList.prd'"
					value="목록보기"></td>
			</tr>
		</table>
</body>
</html>

<%@ include file="./../common/main_bottom.jsp"%>