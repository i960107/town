<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="./../common/main_top.jsp"%>
<%@include file="../common/common.jsp"%>

<section class="latest-blog spad">
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
<!-- 카테고리,키워드,주소 필터설정 -->
		<form method="post" action="list.bd">
			<c:if test="${category==null}">
				<c:forEach begin="0" end="${fn:length(category_list)-1}" var="i">
					<span class="col-md-2 col-lg-2"> <input type="checkbox"
						name="category" value="${category_list[i].no}" checked>${category_list[i].categoryName}
					</span>
				</c:forEach>
			</c:if>
			<c:if test="${category!=null}">
				<c:forEach begin="0" end="${fn:length(category_list)-1}" var="i">
					<span class="col-md-2 col-lg-2">
						<input type="checkbox" name="category"
							value="${cateogory_list[i].no}"
							<c:if test="${fn:contains(category,category_list[i].no)}">checked</c:if>>${category_list[i].categoryName}
					</span>
				</c:forEach>
			</c:if>
			<div class="col-md-12">
				결과 내 재검색 <input type="text" name="keyword" value="${keyword}">
				<input type="submit" value="검색">
			</div>
		</form>
		<div>
			<button type="button" onClick="location.href='insert.bd'">글쓰기</button>
			<select name="address1" id="address1" onChange="selCity()">
				<option>시를 선택</option>
			</select> <select name="address2">
				<option>동을 선택</option>
			</select>
		</div>
	<!-- 	검색결과출력 -->
		<div class="row">
			<div class="col-lg-8 col-md-10">
				<c:if test="${fn:length(board_list)==0}">
			등록된 글이 없습니다.
			</div>
			</c:if>
			<c:if test="${fn:length(board_list)!=0}">
				<c:forEach var="board" items="${board_list}">

					<div data-toggle="modal" data-target="#myModal${board.no}">
						<table>
							<tr>
								<td><img
									src="${pageContext.request.contextPath}/resources/img/latest-1.jpg"
									width=300 height=300></td>
								<td>
									<div class="tag-share">
										<div class="details-tag">
											<ul>
												<li><i class="fa fa-tags"></i></li>
												<li>${board.category}</li>
											</ul>
										</div>
									</div>
									<h4>${board.subject}</h4>
									<p>${board.contents}</p>
								</td>
							</tr>
							<tr>
								<td colspan=2><i class="fa fa-calendar-o"></i>${board.regDate}
									<i class="fa fa-comment-o"></i> ${board.readcount}</td>
							</tr>
						</table>

					</div>

					<!-- Modal -->
					<div class="modal fade" id="myModal${board.no}" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">${board.subject}</h4>
								</div>
								<div class="modal-body">
									<img
										src="${pageContext.request.contextPath}/resources/img/latest-1.jpg"
										width=300 height=300> ${board.contents}
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>