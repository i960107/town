<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/main_top.jsp"%>
<%@include file="../common/common.jsp"%>
<script type="text/javascript">
	/* 좋아요 싫어요 함수 호출 */
	function boardLike() {
		location.href = "like.bd?townBoardNo=${board.no}&userId=${loginInfo.id}";
	}
	function boardUnLike(liker) {
		location.href = "unlike.bd?townBoardNo=${board.no}&no=" + liker;
	}
</script>
<style type="text/css">
.carousel-item {
	height: 400px;
	width: 400px;
}

.btn_img_nomal {
	background: url("<%=source%>resources/img/btn_nomal.png");
	border: none;
	width: 100px;
	height: 30px;
	cursor: pointer;
	background-size: cover;
	font-size: 16px;
	font-weight: bold;
	color: #EEFFFF;
}

.btn_img_like {
	background: url("<%=source%>resources/img/btn_like.png");
	border: none;
	width: 100px;
	height: 30px;
	cursor: pointer;
	background-size: cover;
	font-size: 16px;
	font-weight: bold;
	color: #EEFFFF;
}

.box {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#carousel-example-generic {
	width: 400px;
	height: 400px;
}
</style>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="blog-details-inner">
				<div class="blog-detail-title">
					<h2>${board.subject}</h2>
					<p>
						<img class="box"
							src="${pageContext.request.contextPath}/resources/members/${writer.image}"
							width=100 height=100> ${board.writer } <span> <fmt:parseDate
								value=" ${board.regDate}" var="regDateParsed"
								pattern="yyyy-MM-dd HH:mm:ss.s" /> <fmt:formatDate
								value="${regDateParsed}" pattern="yyyy-mm-dd"
								var="regDateFormatted" /> ${regDateFormatted }
						</span>
					</p>
				</div>

			</div>
		</div>
	</div>
	<c:if test="${fn:length(boardFileList)==0}">
		<div class="row">
			<div class="col-lg-12" align="center">${board.contents}</div>
			<div class="col-lg-12" align="right">
				<c:forTokens items="${board.category }" delims="," var="ctg">
					<c:forEach begin="0" end="${fn:length(categoryList)-1}" var="i">
						<c:if test="${categoryList[i].no==ctg}">
							<button type="button" class="btn btn-danger">${categoryList[i].categoryName}</button>
						</c:if>
					</c:forEach>
				</c:forTokens>
			</div>
		</div>
	</c:if>
	<c:if test="${fn:length(boardFileList)!=0}">
		<div class="row">
			<div class="col-lg-4">
				<div id="carousel-example-generic" class="carousel slide">
					<!-- Indicators(이미지 하단의 동그란것->class="carousel-indicators") -->
					<ol class="carousel-indicators">
						<c:forEach var="item" items="${boardFileList}" varStatus="i">
							<li data-target="#carousel-example-generic"
								data-slide-to="i.index"
								<c:if test="${i.index==0}">class="active"</c:if>></li>
						</c:forEach>
					</ol>
					<!-- Carousel items -->

					<div class="carousel-inner">
						<c:forEach var="item" items="${boardFileList}" varStatus="i">
							<div
								class="carousel-item <c:if test="${i.index==0}">active</c:if> set-bg"
								data-setbg="${pageContext.request.contextPath}/resources/${item.fileName}">
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-lg-8" align="center">${board.contents}</div>
			<div class="col-lg-8" align="right">
				<c:forTokens items="${board.category }" delims="," var="ctg">
					<c:forEach begin="0" end="${fn:length(categoryList)-1}" var="i">
						<c:if test="${categoryList[i].no==ctg}">
							<button type="button" class="btn btn-danger">${categoryList[i].categoryName}</button>
						</c:if>
					</c:forEach>
				</c:forTokens>
			</div>
		</div>
	</c:if>
	<div class="row">
		<div class="col-lg-12">

			<i class="fa fa-comment-o"></i> 댓글수 <span>조회수</span>${board.readcount}
			<c:set var="loginId">${loginInfo.id}</c:set>
			<c:set var="heart" value="&#10084;" />
			<c:set var="likecondition" value="boardLike()" />
			<c:forEach var="i" items="${likeList}">
				<c:if test="${loginId==i.userId }">
					<c:set var="heart">&#128151; </c:set>
					<c:set value="${i.no}" var="likeNo" />
					<c:set var="likecondition" value="boardUnLike(${likeNo})" />
				</c:if>
			</c:forEach>
			<input type="button" name="like" value="${heart}공감${likeCnt}"
				onclick="${likecondition}" class="btn_img_like">
		</div>
	</div>

	<div class="row">
		<c:if test="${loginInfo==null}">
			<div class="col-lg-12" align="right">
				<form action="insertReply.bd">
					<textarea rows="2" cols="100" readonly="readonly">로그인이 필요한 서비스 입니다</textarea>
					<br> <input type="submit" disabled="disabled" value="댓글쓰기">
				</form>
			</div>
		</c:if>
		<c:if test="${loginInfo!=null}">

			<div class="col-lg-2" align="right">
				<img class="box"
					src="${pageContext.request.contextPath}/resources/members/${loginInfo.image}">${loginInfo.id}
			</div>
			<div class="col-lg-10" align="right">
				<form action="insertReply.bd">
					<textarea rows="2" cols="100"></textarea>
					<br> <input type="submit" value="댓글쓰기">
				</form>
			</div>
		</c:if>
	</div>
</div>
<div class="row">
	<div class="col-lg-12" align="center">
		<input type="button" onClick="location.href='list.bd'" value="목록보기">
	</div>
</div>
<a href="delete.bd?no=${board.no}">삭제</a>
<%@ include file="./../common/main_bottom.jsp"%>