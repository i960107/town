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
<c:set var="val" value="0" />
<c:set var="limit" value="${fn:length(fileList) }" />
<script type="text/javascript" src="<%=source%>/resources/js/jquery.js"></script>

<script type="text/javascript">
	/* 좋아요 싫어요 함수 호출 */
	function prdLike() {
		location.href = "like.prd?no=${pBean.no}";
	}
	function prdUnLike(liker) {
		location.href = "unlike.prd?no=${pBean.no}&like=" + liker;
	}
</script>
<style type="text/css">
.price {
	font-size: 20px;
	color: #010101;
	font-weight: bold;
}

.subject {
	font-size: 15px;
	color: #BBBBBB;
	font-weight: bold;
}

.mcontent {
	font-size: 15px;
	color: #CCCCCC;
}

.btn_img_nomal {
	background: url("<%=source%>resources/img/btn_nomal.png");
	border: none;
	width: 210px;
	height: 80px;
	cursor: pointer;
	background-size: cover;
	font-size: 16px;
	font-weight: bold;
	color: #EEFFFF;
}

.btn_img_like {
	background: url("<%=source%>resources/img/btn_like.png");
	border: none;
	width: 210px;
	height: 80px;
	cursor: pointer;
	background-size: cover;
	font-size: 16px;
	font-weight: bold;
	color: #EEFFFF;
}

.imgsize {
	height: 250px;
	width: 250px;
	margin: auto;
}
</style>
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
			<!-- 상품정보 -->
			<td><img alt="" src="<%=source%>resources/${pBean.image1}"
				height="360" width="300"></td>
			<td>
				<table>
					<tr height="72">
						<td colspan="3"><span class="subject">${pBean.subject }</span></td>
					</tr>
					<tr height="72">
						<td colspan="3"><span class="price"><fmt:formatNumber
									pattern="###,###">${pBean.price }</fmt:formatNumber> 원</span> <br>
							<hr></td>
					</tr>
					<tr height="72">
						<!-- 조회수 / 등록일 / 신고 -->
						<td width="120"><span class="mcontent">&#128065;
								${pBean.readcount }</span></td>
						<td width="120"><span class="mcontent">${pBean.regdate }</span></td>
						<td width="120"><a href="report.prd"><span
								class="mcontent">신고하기</span></a></td>
					</tr>
					<tr height="72">
						<td colspan="3" valign="top"><span class="mcontent">거래지역</span>
							<span style="font-size: 15px; font-weight: bold; color: #A0A0A0;">:
								${pBean.address }</span></td>
					</tr>
					<tr height="72">

						<!-- 좋아요 싫어요 하트 색 / 유동 함수 -->
						<td><c:set var="loginId"><%=loginId%></c:set> <c:set
								var="heart" value="&#10084;" /> <c:set var="likecondition"
								value="prdLike()" /> <c:forEach var="i" items="${likeList }">
								<c:if test="${loginId==i.userid }">
									<c:set var="heart">&#128151; </c:set>
									<c:set value="${i.no }" var="likeNo" />
									<c:set var="likecondition" value="prdUnLike(${likeNo })" />
								</c:if>
							</c:forEach> <input type="button" name="like" value="${heart } 찜 ${likeCnt}"
							onclick="${likecondition}" class="btn_img_like"></td>


						<td>
							<!-- 판매자 = 수정하기 / 구매자 = 연락하기 --> <c:set var="btnType">연락하기</c:set>
							<c:set var="scriptType">chat()</c:set> <c:if
								test="${loginId==pBean.sellerid }">
								<c:set var="btnType">수정하기</c:set>
								<c:set var="scriptType">updateProduct()</c:set>
							</c:if> <input type="button" value="${btnType }" onclick="${scriptType}"
							class="btn_img_nomal">
						</td>


						<td></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<!-- 회원 정보 -->
			<td><a href="tradeDetail.mb?sellerid=${sellerid }">
			<img alt="" src="<%=source%>resources/members/${mbean.image}" width="70" height="70"></a>
			</td>
			<td valign="top"><a href="tradeDetail.mb?sellerid=${sellerid }"><span
					style="font-size: 14px; color: #101010; font-weight: bold;">${sellerid }</span>
			</a></td>
		</tr>
	</table>
	<!-- 상품 내용 -->
	<table>
		<tr>
			<td width="400" valign="top" height="370">
				<hr> <span>${pBean.contents }</span>
			</td>
			<td height="370"><c:forEach var="i" items="${fileList }">
					<c:set var="val" value="${val+1 }" />
					<a><img alt="" src="<%=source%>resources/${i.filename }"
						class="imgsize"></a>
					<c:if test="${val%2==0 }">
						<br>
					</c:if>
				</c:forEach></td>
		</tr>
	</table>
	</div>
</body>
</html>
<%@ include file="./../common/main_bottom.jsp"%>