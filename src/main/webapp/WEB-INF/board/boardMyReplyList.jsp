<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../../MyTown.jsp"%>


boardMyReplyList.jsp <br>  
나의 당근 > 내 댓글

<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>나의 동네생활 댓글</h2>
					<table width="900px" class="sectable" border="1">
						<div class="group-input">
							<tr align="center">
								<th class="group-input"><label>NO </label></th>
								<th class="group-input"><label>제목</label></th>
								<th class="group-input"><label>카테고리</label></th>
								<th class="group-input"><label>댓글 내용</label></th>
								<th class="group-input"><label>등록일</label></th>
								<th class="group-input"><label>삭제</label></th>
								<th class="group-input"><label>수정</label></th>
							</tr>

							<c:forEach var="mbrlist" items="${mbrlists }">
								<tr align="center">
									<th class="group-input"><label>${mbrlist.no } </label></th>
									<th class="group-input"><label>${mbrlist.subject } </label></th>
									<th class="group-input"><label>${mbrlist.category } </label></th>
									<th class="group-input"><label>${mbrlist.contents } </label></th>
									<th class="group-input"><label>
									<fmt:parseDate value="${mbrlist.regDate } " var="regdate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/>
									</label></th>
									<th class="group-input"><label>삭제</label></th>
									<th class="group-input"><label>수정</label></th>
								</tr>
							</c:forEach>
				
						</div>
					</table>

				</div>
			</div>
		</td>
	</tr>
</table>

<br>
<br>


<%@ include file="./../common/main_bottom.jsp"%>