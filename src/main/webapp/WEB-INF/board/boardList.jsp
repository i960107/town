<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="./../common/main_top.jsp"%>
<%@include file="../common/common.jsp"%>
<div>
			<h2>동네생활</h2>
			<h3>우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</h3>
		</div>
		<form method="get" action="list.bd">
			<div style="background-color: cyan; width: 100%">
				<c:if test="${category==null}">
					<c:forEach items="${cateogory_list}" var="ctg">
						<div class="col-md-2">
							<input type="checkbox" name="category" value="${ctg}" checked>${ctg}
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${category!=null}">
					<c:forEach items="${cateogory_list}" var="ctg">
						<div class="col-md-2">
							<input type="checkbox" name="category" value="${ctg}"
								<c:if test="${fn:contains(category,ctg)}">checked</c:if>>${ctg}
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div>
				결과 내 재검색 <input type="text" name="keyword"> <input
					type="submit" value="검색">
			</div>
		</form>
		<table>
			<tr>
				<th>
					<button type="button" onClick="location.href='insert.bd'">글쓰기</button>
					<select name="address1" id="address1" onChange="selCity()">
						<option>시를 선택</option>
				</select> <select name="address2">
						<option>동을 선택</option>
				</select>
				</th>
			</tr>
			<c:if test="${fn:length(board_list)==0}">
				<tr>
					<td>등록된 글이 없습니다.</td>
				</tr>
			</c:if>	
			<c:if test="${fn:length(board_list)!=0}">
				<c:forEach var="board" items="${board_list}">
					<tr>
						<td>${board.subject}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>