<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../../WEB-INF/member/memberMyPageTop.jsp"%>


productMySaleList.jsp
<br>

<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>나의 판매상품</h2>
					<table width="900px" class="sectable" border="1">

						<tr align="center">
							<th class="group-input"><label>NO </label></th>
							<th class="group-input"><label>이미지 </label></th>
							<th class="group-input"><label>제목</label></th>
							<th class="group-input"><label>카테고리</label></th>
							<th class="group-input"><label>내용</label></th>
							<th class="group-input"><label>가격</label></th>
							<th class="group-input"><label>등록일</label></th>
							<th class="group-input"><label>판매상태</label></th>
							<th class="group-input"><label>조회수</label></th>
							<th class="group-input"><label>삭제</label></th>
							<th class="group-input"><label>수정</label></th>

						</tr>

						<c:forEach var="mslist" items="${mySaleLists }">
							<tr align="center">
								<td class="group-input"><label>${mslist.no +1 } </label></td>
								<td class="group-input"><label> <a
										href="detail.prd?no=${mslist.no}&sellerid=${sellerid}"> <img
											src="<%= request.getContextPath() %>/resources/${mslist.image1 }"
											width="40px" height="40px">
									</a>
								</label></td>
								<td class="group-input"><label> 
									<a href="detail.prd?no=${mslist.no}&sellerid=${sellerid}">
											${mslist.subject } </a>
								</label></td>
								<td class="group-input"><label>${mslist.category }
								</label></td>
								<td class="group-input"><label>${mslist.contents }
								</label></td>
								<td class="group-input"><label>${mslist.price } 원</label></td>
								<td class="group-input"><label> <fmt:parseDate
											value="${mslist.regdate } " var="regdate"
											pattern="yyyy-MM-dd" /> <fmt:formatDate value="${regdate }"
											pattern="yyyy-MM-dd" />
								</label>
								</th>
								<td class="group-input"><label> <c:if
											test="${mslist.dealstatus == 1}">판매중</c:if>
								</label></td>
								<td class="group-input"><label>${mslist.readcount }
								</label></td>
								<td class="group-input"><label>삭제</label></td>
								<td class="group-input"><label>수정</label></td>
							</tr>
						</c:forEach>


					</table>

				</div>
			</div>
		</td>
	</tr>
</table>

<br>
<br>


<%@ include file="./../common/main_bottom.jsp"%>

