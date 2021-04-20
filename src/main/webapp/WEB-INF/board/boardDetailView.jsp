<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/main_top.jsp"%>
<%@include file="../common/common.jsp"%>
<%@include file="./../product/prdStyle.jsp"%>
<link rel="stylesheet" href="../common/style.css">
<script type="text/javascript">
	/* 좋아요 싫어요 함수 호출 */
	function prdLike() {
		location.href = "like.bd?townBoardNo=${board.no}&userId=${loginInfo.id}";
	}
	function prdUnLike(liker) {
		location.href = "unlike.bd?townBoardNo=${board.no}&userId=${loginInfo.id}&no="
				+ liker;
	}
	/* 시간바꿔주는 함수 */
	function displayTime(regdate) {
		const timeValue = new Date(regdate);
		const milliSeconds = new Date() - timeValue;
		const seconds = milliSeconds / 1000;
		if (seconds < 60)
			return `방금 전`
		const minutes = seconds / 60
		if (minutes < 60)
			return Math.floor(minutes) + '분 전';
		const hours = minutes / 60
		if (hours < 24)
			return Math.floor(hours) + '시간 전';
		const days = hours / 24
		if (days < 7)
			return Math.floor(days) + '일 전';
		return timeValue.getFullYear() + '년 ' + timeValue.getMonth() + '월 '
				+ timeValue.getDate() + '일';
	}
</script>
<style type="text/css">
.carousel-item {
	height: 350px;
	width: 350px;
}

.box {
	display: inline-block;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	overflow: hidden;
}

.profile {
	width: 120px;
	height: 120px;
	object-fit: cover;
}

#carousel-example-generic {
	width: 350px;
	height: 350px;
}

.flex-container {
	display: flex;
	justify-content: space-between;
	width: 100%;
	font-size: 20px;
}

flex-container-reply {
	display: flex;
}

.flex-container-start {
	display: flex;
	justify-content: flex-start;
	width: 100%;
	font-size: 20px;
}
</style>
<section class="blog-details spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="blog-details-inner">
					<div class="blog-detail-title">
						<h2>${board.subject}</h2>

						<p>
							<c:if test="${writer.sitestatus==0}">
								<a href='tradeDetail.mb?sellerid=${board.writer}'>
									<div class="box">
										<img
											src="${pageContext.request.contextPath}/resources/members/${writer.image}"
											class="profile" />
									</div> ${writer.id }
								</a>
							</c:if>
							<c:if test="${writer.sitestatus==1}">
								<a href='tradeDetail.mb?sellerid=${board.writer}'>
									<div class="box">
										<img src="${writer.image}" class="profile" />
									</div> ${writer.name }
								</a>
							</c:if>



							<!-- 시간 바꿔서 출력하기 Javascript코드 -->
							<span><script type="text/javascript">
								document
										.write(displayTime('<c:out value="${board.regDate}"/>'));
							</script></span>
						</p>
					</div>
					<div class="flex-container-start">
						<!-- 파일있을때만 이미지 div 생김 -->
						<c:if test="${fn:length(boardFileList)!=0}">
							<div>
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
						</c:if>
						<div style="margin-left: 20px">${board.contents}</div>
					</div>

					<div class="tag-share flex-container">
						<div class="details-tag">
							<ul>
								<li><i class="fa fa-tags"></i></li>
								<c:if test="${board.category==null}">
									<c:forEach begin="0" end="${fn:length(bCategoryList)-1}"
										var="i">
										<c:if test="${bCategoryList[i].no==board.category}">
											<li>${bCategoryList[i].categoryName}</li>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${board.category!=null}">
									<c:forTokens items="${board.category}" delims="," var="ctg">
										<c:forEach begin="0" end="${fn:length(bCategoryList)-1}"
											var="i">
											<c:if test="${bCategoryList[i].no==ctg}">
												<li>${bCategoryList[i].categoryName}</li>
											</c:if>
										</c:forEach>
									</c:forTokens>
								</c:if>
							</ul>
						</div>
						<div>
							<span class="mcontent">&#128065; : ${board.readcount}</span>

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
							<%-- <a href="report.mb?reported_userid=${board.writer}"> --%>
							<c:if test="${loginInfo.id==board.writer}">
								<input type="button"
									onClick="location.href='update.bd?no=${board.no}'" value="수정하기"
									class="btn_img_nomal">
							</c:if>
							<a href="report.mb?reporteduserid=${sellerid}"><span
								class="mcontent">신고하기</span> </a>

						</div>
					</div>
					<div align="center">
						<input type="button" onClick="location.href='list.bd'"
							value="목록보기" class="site-btn register-btn">
						<c:if test="${loginInfo.id==board.writer}">
							<input type="button"
								onClick="location.href='delete.bd?no=${board.no}'" value="삭제하기"
								class="site-btn register-btn">

						</c:if>
					</div>
					<div class="blog-post flex-container">

						<c:if test="${previousBoard!=null}">
							<div>
								<a href="detailView.bd?no=${previousBoard.no}" class="prev-blog">

									<div class="pb-pic">
										<c:if test="${prevImage!=null }">
											<div class="box">
												<i class="ti-arrow-left"></i> <img
													src="${pageContext.request.contextPath}/resources/${prevImage}"
													alt="" class="profile">
											</div>
										</c:if>
										<c:if test="${prevImage==null }">
											<i class="ti-arrow-left"></i>
										</c:if>
									</div>
									<div class="pb-text">
										<span>Previous Post:</span>
										<h5>${previousBoard.subject}</h5>
									</div>
								</a>
							</div>
						</c:if>
						<c:if test="${previousBoard==null}">
							<div>처음 글 입니다</div>
						</c:if>
						<c:if test="${nextBoard!=null}">
							<div>
								<a href="detailView.bd?no=${nextBoard.no}" class="next-blog">
									<div class="pb-pic">
										<c:if test="${nextImage!=null }">
											<div class="box">
												<img
													src="${pageContext.request.contextPath}/resources/${nextImage}"
													alt="" class="profile">
											</div>
											<i class="ti-arrow-right"></i>
										</c:if>
										<c:if test="${nextImage!=null }">
											<i class="ti-arrow-right"></i>
										</c:if>
									</div>
									<div class="nb-text">
										<span>Next Post:</span>
										<h5>${nextBoard.subject}</h5>
									</div>
								</a>
							</div>
						</c:if>
						<c:if test="${nextBoard==null}">
							<div>마지막 글 입니다</div>
						</c:if>
					</div>
					<!-- 댓글쓰기 -->
					<div class="leave-comment">
						<h4>댓글</h4>
						<c:if test="${loginInfo!=null}">
							<form action="reply.bd" class="comment-form">
								<div class="row">
									<input type="hidden" name="writer" value="${loginInfo.id}">
									<input type="hidden" name="ref" value="${board.no}"> <input
										type="hidden" name="reStep" value="1"> <input
										type="hidden" name="reLevel" value="0">
									<div class="col-lg-6">
										<a href='tradeDetail.mb?sellerid=${loginInfo.id}'>
											<div class="box">
												<img
													src="${pageContext.request.contextPath}/resources/members/${loginInfo.image}"
													class="profile" /> ${loginInfo.id}
										</a>
									</div>
								</div>
								<div class="col-lg-12">
									<textarea name="contents" placeholder="Message"
										style="margin-bottom: 15px"></textarea>
									<button type="submit" class="site-btn">댓글달기</button>
								</div>
					</div>
					</form>
					</c:if>
					<c:if test="${loginInfo==null }">
						<form class="comment-form" action="reply.bd">
							<div class="row">
								<div class="col-lg-12">
									<textarea name="contents" disabled="disabled"
										placeholder="로그인이 필요한 페이지입니다" style="margin-bottom: 15px"></textarea>
									<button class="site-btn">로그인하기</button>
								</div>
							</div>
						</form>

					</c:if>
				</div>
				<!-- 댓글출력 -->
				<div>
					<c:forEach var="reply" items="${replyList}">
						<div class="posted-by flex-container-row">
							<div class="pb-pic">
								<c:set var="reLevel" value="${reply.reLevel}" />
								<c:if test="${reply.reStep!=1}">
									<img
										src="${pageContext.request.contextPath}/resources/level.gif"
										width="${(reply.reStep-1)*50}">
									<img
										src="${pageContext.request.contextPath}/resources/right-arrow.png"
										width="50">
								</c:if>
							</div>
							<div>
								<a href="tradeDetail.mb?sellerid=${reply.writer}"
									style="display: inline"> ${reply.writer}</a><span><script
										type="text/javascript">
										document
												.write(displayTime('<c:out value="${reply.regDate}"/>'));
									</script></span>
								<p>${reply.contents}
									<input data-toggle="modal" data-target="#myModal${reply.no}"
										type="button" value="답글 달기">
								</p>
							</div>
						</div>
						<div class="modal fade" id="myModal${reply.no}" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form name="myform" action="reply.bd">
											<input type="hidden" name="writer" value="${loginInfo.id}">
											<input type="hidden" name="ref" value="${board.no}">
											<input type="hidden" name="reLevel" value="${reply.reLevel}">
											<input type="hidden" name="reStep" value="${reply.reStep+1}">
											<textarea name="contents" cols="40"></textarea>
											<button type="submit" class="btn btn-primary">답글달기</button>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>

									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>
</section>


<%@ include file="./../common/main_bottom.jsp"%>