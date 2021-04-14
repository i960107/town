<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="./../common/main_top.jsp"%>
<%@include file="../common/common.jsp"%>
<style type="text/css">
.board {
	margin-bottom: 30px;
}

.box {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	overflow: hidden;
}
</style>

<!-- 페이지설명 -->
<section class="latest-blog spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>동네생활</h2>
					<h3>우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</h3>
				</div>
			</div>
			<!-- 검색필터설정 -->
			<div class="row">
				<div class="col-lg-12">
					<form action="list.bd" method="post">

						<table>
							<tr style="background-color: #FFFFF0;">
								<td colspan=2 align="center" style="padding-top: 10px"
									valign="middle"><h5>
										<b>카테고리</b>
									</h5></td>
							</tr>
							<tr style="background-color: #FFFFF0">
								<td colspan=2 height="100"><c:if test="${category==null}">
										<c:forEach items="${categoryList}" var="ctg">
											<span class="col-md-2"><input type="checkbox"
												name="category" value="${ctg.no}" checked>${ctg.categoryName}
											</span>
										</c:forEach>
									</c:if> <c:if test="${category!=null}">
										<c:forEach items="${categoryList}" var="ctg">
											<span class="col-md-2"> <input type="checkbox"
												name="category" value="${ctg.no}"
												<c:forTokens items="${category}" delims="," var="ct">
													<c:if test="${ct==ctg.no}">checked</c:if>
													</c:forTokens>>${ctg.categoryName}
											</span>
										</c:forEach>
									</c:if></td>
							</tr>
							<tr>
								<td><button type="button" class="btn btn-warning"
										onClick="location.href='insert.bd'" style="width: 100;">
										<b>글쓰기</b>
									</button>
								<td height="50" align="right">결과 내 재검색 <input type="text"
									name="keyword" value="${keyword}"> <input type="submit"
									value="검색">

								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12" align="right"
				style="padding-top: 40px; padding-bottom: 10px; vertical-align: bottom;">
				<%@include file="../common/addrArray.jsp"%>
			</div>
		</div>

		<c:forEach var="board" items="${boardList}">
			<div class="row board" style="background-color: #F8F9FA">
				<div class="col-lg-4 col-md-6">
					<div class="single-latest-blog">
						<c:set var="flag" value="false" />
						<c:forEach var="bean" items="${boardFileList}">
							<c:if test="${flag==false}">
								<c:if test="${bean.bno==board.no}">
									<img
										src="${pageContext.request.contextPath}/resources/${bean.fileName}"
										width=150 height=200 />
									<c:set var="flag" value="true" />
								</c:if>
							</c:if>
						</c:forEach>
						<div class="latest-text">
							<a href="#">

								<h4><a href="tradeDetail.mb?sellerid=${board.writer}">${board.writer}</a></h4>
							</a> </a> <i class="fa fa-calendar-o"></i>
							<fmt:parseDate value=" ${board.regDate}" var="regDateParsed"
								pattern="yyyy-MM-dd HH:mm:ss.s" />
							<fmt:formatDate value="${regDateParsed}" pattern="yyyy-MM-dd"
								var="regDateFormatted" />
							${regDateFormatted } <i class="fa fa-comment-o"></i> 댓글수 <span>조회수</span>${board.readcount}


						</div>
					</div>
				</div>
				<div class="col-lg-8 col-md-6" style="padding-bottom: 30px">
					<c:forTokens items="${board.category }" delims="," var="ctg">
						<c:forEach begin="0" end="${fn:length(categoryList)-1}" var="i">
							<c:if test="${categoryList[i].no==ctg}">
								<button type="button" class="btn btn-danger"
									style="margin: 10px 5px; text-align: justify;">${categoryList[i].categoryName}</button>
							</c:if>
						</c:forEach>
					</c:forTokens>
					<br>
					<h4>
						<b>${board.subject}</b>
					</h4>
					<br> ${fn:substring(board.contents,0,10)}&nbsp&nbsp<a href='detailView.bd?no=${board.no}'>...더보기</a>
				</div>
			</div>



		</c:forEach>
	</div>
</section>
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
}
</style>
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<h3 class="progress-title">매너온도</h3>
			<div class="progress">
				<div class="progress-bar bg-danger" style="width: 85%;">
					<div class="progress-value">20℃</div>
				</div>
			</div>

			<div class="col-md-6">
				<h3 class="progress-title">매너온도</h3>
				<div class="progress">
					<div class="progress-bar" style="width: 20%;">
						<div class="progress-value">20℃</div>
					</div>
				</div>

				<h3 class="progress-title">매너온도</h3>
				<div class="progress">
					<div class="progress-bar bg-warning" style="width: 36.5%;">
						<div class="progress-value">36.5℃</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="rating-form">
	<form class="rating-form" action="#" method="post" name="rating-movie">
		<center>
			<h6>거래는 어떠셨나요?</h6>
		</center>
		<fieldset class="form-group">
			<div class="form-item">

				<input id="rating-5" name="rating" type="radio" value="5" /> <label
					for="rating-5" data-value="최고예요!"> <span
					class="rating-star"> <i class="fa fa-star-o"></i> <i
						class="fa fa-star"></i>
				</span> <span class="ir">5</span>
				</label> <input id="rating-4" name="rating" type="radio" value="4" /> <label
					for="rating-4" data-value="좋아요!"> <span class="rating-star">
						<i class="fa fa-star-o"></i> <i class="fa fa-star"></i>
				</span> <span class="ir">4</span>
				</label> <input id="rating-3" name="rating" type="radio" value="3" /> <label
					for="rating-3" data-value="그저그래요!"> <span
					class="rating-star"> <i class="fa fa-star-o"></i> <i
						class="fa fa-star"></i>
				</span> <span class="ir">3</span>
				</label> <input id="rating-2" name="rating" type="radio" value="2" /> <label
					for="rating-2" data-value="별로예요!"> <span
					class="rating-star"> <i class="fa fa-star-o"></i> <i
						class="fa fa-star"></i>
				</span> <span class="ir">3</span>
				</label> <input id="rating-1" name="rating" type="radio" value="1" /> <label
					for="rating-1" data-value="최악이예요!"> <span
					class="rating-star"> <i class="fa fa-star-o"></i> <i
						class="fa fa-star"></i>
				</span> <span class="ir">3</span>
				</label>

				<div class="form-action">
					<input class="btn-reset" type="reset" value="Reset" />
				</div>


			</div>

		</fieldset>
	</form>
</div>