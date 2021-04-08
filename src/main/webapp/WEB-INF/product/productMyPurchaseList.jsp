<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../../WEB-INF/member/memberMyPageTop.jsp"%>


<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>나의 구매 상품</h2>
					<table width="900px" class="sectable" border="1">
						<div class="group-input">
							<tr align="center">
								<th class="group-input"><label>NO </label></th>
								<th class="group-input"><label>이미지 </label></th>
								<th class="group-input"><label>제목</label></th>
								<th class="group-input"><label>카테고리</label></th>
								<th class="group-input"><label>설명</label></th>
								<th class="group-input"><label>가격</label></th>
								<th class="group-input"><label>등록일</label></th>
								<th class="group-input"><label>판매상태</label></th>
								<th class="group-input"><label>조회수</label></th>
								<th class="group-input"><label>삭제</label></th>
								<th class="group-input"><label>수정</label></th>

							</tr>

							<c:forEach var="saleList" items="${saleLists }">
								<tr align="center">
									<td class="group-input">${saleList.no }</td>
									<td class="group-input">${saleList.image1 }</td>
									<td class="group-input">${saleList.subject }</td>
									<td class="group-input">${saleList.category }</td>
									<td class="group-input">${saleList.contents }</td>
									<td class="group-input">${saleList.price }</td>
									<td class="group-input">
										<fmt:parseDate value="${saleList.regdate }" var="regdate" pattern="yyyy-MM-dd" />
										<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/>
									
									</td>
									<td class="group-input">
									<c:if test="${saleList.dealstatus == 1}"> 판매중 </c:if> 
									
									</td>
									<td class="group-input">${saleList.readcount }</td>
									<td class="group-input"><a href="">삭제</a></td>
									<td class="group-input">수정</td>
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