<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="./../common/main_top.jsp"%>
<%@include file="../common/common.jsp"%>
<link rel="stylesheet" href="../common/style.jsp">
<section>
	<!-- 페이지설명 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>동네생활</h2>
					<h3>우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</h3>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
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
			<tr><td><input type="button" value="글쓰기" onClick="location.href='insert.bd'">
			</td></tr>
			<tr><td><%@include file="../common/addrArray.jsp"%>
				</td></tr>
		</table>
		<c:forEach var="board" items="${boardList}">
			<!--글하나 -->
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="single-latest-blog">
						<div data-toggle="modal" data-target="#myModal${board.no}">
							<table border=1 class="col-lg-12">
								<tr>
									<td rowspan=2><img
										src="${pageContext.request.contextPath}/resources/img/latest-1.jpg"
										width=150 /></td>
									<td><c:forTokens items="${board.category }" delims=","
											var="ctg">
											<c:forEach begin="0" end="${fn:length(categoryList)-1}"
												var="i">
												<c:if test="${categoryList[i].no==ctg}">
													<button type="button" class="btn btn-danger">${categoryList[i].categoryName}</button>
												</c:if>
											</c:forEach>
										</c:forTokens></td>
								</tr>
								<tr>
									<td><h4>
											<b>${board.subject}</b>
										</h4> <br> ${board.contents}</td>
								</tr>
								<tr>
									<td><img
										src="<%=request.getContextPath() %>/resrouces/${loginInfo.image}"
										class="img-circle" width="30" height=30>${board.writer}<br>
										<i class="fa fa-calendar-o"></i> ${board.regDate} <i
										class="fa fa-comment-o"></i> ${board.readcount} <a
										class="btn btn-default" href="" role="button">공감하기</a></td>
									<td>
										<form method="post" action="insertReply.bd">
											<textarea cols="50" rows="2" name="contentx"></textarea>
											<input type="submit" value="댓글쓰기">
										</form>
									</td>
								</tr>
							</table>

						</div>

						<!-- Modal -->
						<div class="modal fade bs-example-modal-lg"
							id="myModal${board.no}" tabindex="-1" role="dialog"
							aria-labelledby="myLargeModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">${board.subject}</h4>
									</div>
									<div class="modal-body">${board.contents}</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save
											changes</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 모달끝-->
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</div>
</section>