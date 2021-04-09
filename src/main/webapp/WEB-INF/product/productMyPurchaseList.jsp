<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../../WEB-INF/member/memberMyPageTop.jsp"%>
    
productMyPurchaseList.jsp<br>


<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>나의 구매상품</h2>
					<table width="900px" class="sectable" border="1">
						<div class="group-input">
							<tr align="center">
								<th class="group-input"><label>NO </label></th>
								<th class="group-input"><label>상품번호 </label></th>
								<th class="group-input"><label>판매자</label></th>
								<th class="group-input"><label>구매날짜</label></th>
							</tr>

							<c:forEach var="mdlist" items="${mdlists }">
								<tr align="center">
									<th class="group-input"><label>${mdlist.no } </label></th>
									<th class="group-input"><label>${mdlist.productNo } </label></th>
									<th class="group-input"><label>${mdlist.sellerId } </label></th>
									<th class="group-input"><label>
									<fmt:parseDate value="${mdlist.dealDate } " var="dealDate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${dealDate }" pattern="yyyy-MM-dd"/>
									</label></th>
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