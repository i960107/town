<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/main_top.jsp"%>
<%@include file="../common/common.jsp"%>
<link rel="stylesheet" href="../common/style.css">
<script type="text/javascript">
	/* 좋아요 싫어요 함수 호출 */
	function prdLike() {
		location.href = "like.bd?townBoardNo=${board.no}&userId=${loginInfo.id}";
	}
	function prdUnLike(liker) {
		location.href = "unlike.bd?townBoardNo=${board.no}&userId=${loginInfo.id}&no=" + liker;
	}
</script>
<style type="text/css">
.carousel-item {
	height: 400px;
	width: 400px;
}

.box {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	overflow: hidden;
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
							src="${pageContext.request.contextPath}/resources/members/${writer.image}">
						${board.writer } <span> <fmt:parseDate
								value=" ${board.regDate}" var="regDateParsed"
								pattern="yyyy-MM-dd HH:mm:ss.s" /> <fmt:formatDate
								value="${regDateParsed}" pattern="yyyy-MM-dd"
								var="regDateFormatted" /> ${regDateFormatted }
						</span>
					</p>
				</div>

			</div>
		</div>
	</div>
	<c:if test="${fn:length(boardFileList)==0}">
		<div class="row">
			<div class="col-lg-12">${board.contents}</div>
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
			<div class="col-lg-8">
				<div class="row">
					<div class="col-lg-12">${board.contents}</div>
				</div>
				<div class="row">
					<div class="col-lg-12" align="right">
${board.category }
						<c:if test="${board.category==null}">
							<c:forEach begin="0" end="${fn:length(categoryList)-1}" var="i">
								<c:if test="${categoryList[i].no==board.category}">
									<button type="button" class="btn btn-danger">${categoryList[i].categoryName}</button>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${board.category!=null}">
							<c:forTokens items="${board.category}" delims="," var="ctg">
								<c:forEach begin="0" end="${fn:length(categoryList)-1}" var="i">
									<c:if test="${categoryList[i].no==ctg}">
										<button type="button" class="btn btn-danger">${categoryList[i].categoryName}</button>
									</c:if>
								</c:forEach>
							</c:forTokens>
						</c:if>
					</div>
				</div>


			</div>


		</div>
		<div class="row"></div>
	</c:if>
	<div class="row">
		<div class="col-lg-12">
			<i class="fa fa-comment-o"></i> 댓글수 <span>조회수</span>${board.readcount}
			<c:set var="loginId">${loginInfo.id}</c:set>
			<c:set var="heart" value="&#10084;" />
			<c:set var="likecondition" value="prdLike()" />
			<c:forEach var="i" items="${likeList }">
				<c:if test="${loginId==i.userid }">
					<c:set var="heart">&#128151; </c:set>
					<c:set value="${i.no }" var="likeNo" />
					<c:set var="likecondition" value="prdUnLike(${likeNo })" />
				</c:if>
			</c:forEach>
			<input type="button" name="like" value="${heart }공감하기 ${likeCnt}"
				onclick="${likecondition}" class="btn_img_like">
			</td>


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