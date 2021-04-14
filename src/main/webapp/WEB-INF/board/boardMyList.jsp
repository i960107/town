<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../../MyTown.jsp"%>


boardMyList.jsp <br>  
나의 당근 > 내 글 

<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>나의 동네생활 글</h2>
					<table width="900px" class="sectable" border="1">
						<div class="group-input">
							<tr align="center">
								<th class="group-input"><label>NO </label></th>
								<th class="group-input"><label>제목</label></th>
								<th class="group-input"><label>카테고리</label></th>
								<th class="group-input"><label>내용</label></th>
								<th class="group-input"><label>등록일</label></th>
								<th class="group-input"><label>조회수</label></th>
								<th class="group-input"><label>삭제</label></th>
								<th class="group-input"><label>수정</label></th>

							</tr>

							<c:forEach var="mblist" items="${mblists }">
								<tr align="center">
									<th class="group-input"><label>${mblist.no } </label></th>
									<th class="group-input"><label>${mblist.subject } </label></th>
									<th class="group-input"><label>${mblist.category } </label></th>
									<th class="group-input"><label>${mblist.contents } </label></th>
									<th class="group-input"><label>
									<fmt:parseDate value="${mblist.regDate } " var="regdate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/>
									</label></th>
									<th class="group-input"><label>${mblist.readcount } </label></th>
									<th class="group-input"><label><a href="update.bd?no=${mblist.no }">수정</a></label></th>
									<th class="group-input"><label><a href="delete.bd?no=${mblist.no }">삭제</a></label></th>
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