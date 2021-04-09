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


				<form action="list.bd" method="post">
					<table>
						<tr>
							<td colspan=2><c:if test="${category==null}">
									<c:forEach items="${categoryList}" var="ctg">
										<span class="col-md-2"> <input type="checkbox"
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
							<td colspan=2>결과 내 재검색 <input type="text" name="keyword"
								value="${keyword}"> <input type="submit" value="검색">

							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<table class="col-lg-12">
			<tr>
				<td><input type="button" value="글쓰기"
					onClick="location.href='insert.bd'"></td>
			</tr>
			<tr>
				<td><%@include file="../common/addrArray.jsp"%>
				</td>
			</tr>
		</table>
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

								<h4>
									${board.writer}</h4>
							</a> </a> <i class="fa fa-calendar-o"></i>
							<fmt:parseDate value=" ${board.regDate}" var="regDateParsed"
								pattern="yyyy-MM-dd HH:mm:ss.s" />
							<fmt:formatDate value="${regDateParsed}" pattern="yyyy-mm-dd"
								var="regDateFormatted" />
							${regDateFormatted } <i class="fa fa-comment-o"></i> 댓글수 <span>조회수</span>${board.readcount}


						</div>
					</div>
				</div>
				<div class="col-lg-8 col-md-6">
					<c:forTokens items="${board.category }" delims="," var="ctg">
						<c:forEach begin="0" end="${fn:length(categoryList)-1}" var="i">
							<c:if test="${categoryList[i].no==ctg}">
								<button type="button" class="btn btn-danger">${categoryList[i].categoryName}</button>
							</c:if>
						</c:forEach>
					</c:forTokens>
					<br>
					<h4>
						<b>${board.subject}</b>
					</h4>
					<br>
					<textarea cols="80" rows="2" readonly="readonly"
						style="resize: none"><c:out value="${board.contents}" /></textarea>
					<div onClick="location.href='detailView.bd?no=${board.no}'">...더보기</div>
				</div>
			</div>



		</c:forEach>
	</div>
</section>


