<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../../Category.jsp"%>


<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>중고거래 카테고리</h2>
					<table width="700px" class="sectable">
						<div class="group-input">
							<tr align="center">
								<th class="group-input"><label>NO </label></th>
								<th class="group-input"><label>카테고리명 </label></th>
								<th class="group-input"><label>삭제</label></th>
								<th class="group-input"><label>수정 </label></th>

							</tr>

							<c:forEach var="pclist" items="${pcbean }">
								<tr align="center">
									<td class="group-input">${pclist.no }</td>
									<td class="group-input">${pclist.categoryName }</td>
									<td class="group-input"><a href="prodCateDel.ct?no=${pclist.no }">삭제</a></td>
									<td class="group-input"><a href="prodCateUp.ct?no=${pclist.no }">수정</a></td>
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