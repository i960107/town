<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./category.jsp"%>


<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>동네생활 카테고리</h2>
					<table width="700px" class="sectable">
						<div class="group-input">
							<tr align="center">
								<th class="group-input"><label>NO </label></th>
								<th class="group-input"><label>카테고리명 </label></th>
								<th class="group-input"><label>삭제</label></th>
								<th class="group-input"><label>수정 </label></th>

							</tr>

							<c:forEach var="bclist" items="${bcbean }">
								<tr align="center">
									<td class="group-input">${bclist.no }</td>
									<td class="group-input">${bclist.categoryName }</td>
									<td class="group-input"><a href="boardCateDel.ct?no=${bclist.no }">삭제</a></td>
									<td class="group-input"><a href="boardCateUp.ct?no=${bclist.no }">수정</a></td>
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