<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

<script
	src="${pageContext.request.contextPath}/resources/script/timeFormat.js"></script>
<style type="text/css">
.board {
	margin-bottom: 30px;
	background-color: #F8F9FA;
}

.box {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	overflow: hidden;
}

.flex-container {
	display: flex;
	justify-content: space-between;
}

.flex-container-boardlist {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	width: 100%;
	align-items: center
}

.flex-container-board {
	display: flex;
	flex-direction: row;
	flex-grow: 1 background-color: blue;
	width: 100%;
	margin-bottom: 15px;
	background-color: #dcdcdc;
}
</style>
</head>
<body>
	<%@include file="../common/common.jsp"%>
	<%@include file="./../common/main_top.jsp"%>
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
					<div class="col-lg-12 col-md-12">
						<form action="list.bd" method="post" name="myform">
							<table>
								<tr style="background-color: #FFFFF0;">
									<td colspan=2 align="center" style="padding-top: 10px"
										valign="middle"><h5>
											<b>카테고리</b>
										</h5></td>
								</tr>
								<tr style="background-color: #FFFFF0">
									<td colspan=2 height="100"><c:if test="${category==null}">
										<label for="board_category">
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
										</label>
										</c:if></td>
								</tr>
								<%-- <tr style="background-color: #FFFFF0">
									<td colspan=2 height="50" align="right">결과 내 재검색 <input
										type="text" name="keyword" value="${keyword}"> <input
										type="submit" value="검색">

									</td>
								</tr> --%>

							</table>
						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 flex-container"
					style="padding-top: 10px; padding-bottom: 10px;">
					<div>
						<button type="button" class="btn btn-warning"
							onClick="location.href='insert.bd'"
							style="align: left; width: 100;">
							<b>글쓰기</b>
						</button>
					</div>
					<div>
						
							<input type="hidden" name="request" value="list.bd">
							<c:set var="mbean" value="${loginInfo}" />
						</form>
					</div>
				</div>
			</div>


			<!-- 본문출력 -->
			<div class="flex-container-boardlist">
				<c:forEach var="board" items="${boardList}">
					<div class="flex-container-board">
						<c:set var="flag" value="false" />
						<c:forEach var="bean" items="${boardFileList}">
								<c:if test="${flag==false}">
								<c:if test="${bean.bno==board.no}">
									<div>
										<img
											src="${pageContext.request.contextPath}/resources/${bean.fileName}"
											style="width: 200px; height: 200px; margin-top: 10px" />
									</div>
									<c:set var="flag" value="true" />
								</c:if>
							</c:if>
						</c:forEach>

						<div style="margin-left: 10px">
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
							<br> ${fn:substring(board.contents,0,10)}<br><a
								href='detailView.bd?no=${board.no}'>...더보기</a>

							<div>
								<span> <a href="tradeDetail.mb?sellerid=${board.writer}">${board.writer}</a>
								</span> <i class="fa fa-calendar-o"></i>
								<!-- 시간 바꿔서 출력하기 Javascript코드 -->
								<span><script type="text/javascript">
									document
											.write(displayTime('<c:out value="${board.regDate}"/>'));
								</script></span> <span>조회수</span>${board.readcount}


							</div>

						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>


	<%@ include file="./../common/main_bottom.jsp"%>
</body>