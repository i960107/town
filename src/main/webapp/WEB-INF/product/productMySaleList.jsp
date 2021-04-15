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
					<form action="prodDealup.prd" method="post" id="myForm">
					
					<table width="900px" class="sectable" border="1">
						<tr align="center">
							<th class="group-input"><label>NO </label></th>
							<th class="group-input"><label>이미지 </label></th>
							<th class="group-input"><label>제목</label></th>
							<th class="group-input"><label>카테고리</label></th>
							<th class="group-input"><label>내용</label></th>
							<th class="group-input"><label>가격</label></th>
							<th class="group-input"><label>등록일</label></th>
							<th class="group-input"><label>조회수</label></th>
							<th class="group-input"><label>판매상태</label></th>
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
									<td class="group-input"><label> <a
											href="detail.prd?no=${mslist.no}&sellerid=${sellerid}">
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
									</label></td>
									<td class="group-input"><label>${mslist.readcount }
									</label></td>

							
									<td class="group-input"><label> 
										<select name="deal">
												<option value="1" <c:if test="${mslist.dealstatus == 1}"> selected </c:if> >판매중
												<option value="0" <c:if test="${mslist.dealstatus == 0}"> selected </c:if>>거래완료
												
										</select>
									</label></td>
									<td class="group-input"><label><a href="updateDeal.prd?no=${mslist.no}&deal=${mslist.dealstatus}">수정</a></label></td>
									<td class="group-input"><label><a href="delete.prd?no=${mslist.no}">삭제</a></label></td>
								</tr>
							</c:forEach>


					</table>
					</form>

				</div>
			</div>
		</td>
	</tr>
</table>

<br>
<br>


<%@ include file="./../common/main_bottom.jsp"%>

