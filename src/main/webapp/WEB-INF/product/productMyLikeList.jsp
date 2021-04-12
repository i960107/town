<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>
<%@ include file="../../WEB-INF/member/memberMyPageTop.jsp"%>

<br>
<center>
<div class="group-input">
	<h3>My Like List</h3>
</div>
</center>
<br>
<table align="center" width="80%" >
	<tr>
		<td>
			<div class="col-lg-12 order-1 order-lg-2" align="center">
				<div class="product-list">
					<div class="row">
						<c:forEach var="plList" items="${plLists }">
							<div class="col-lg-3 col-sm-6">
								<div class="product-item">
									<div class="pi-pic">
										<a href="detail.prd?no=${plList.no }&sellerid=${plList.sellerid}">
										<img src="<%=request.getContextPath() %>/resources/${plList.image1}" width="200px" height="250px">
										</a>
										<div class="sale pp-sale">♥</div>
									</div>
									<div class="pi-text">
										<div class="catagory-name">${plList.category}</div>
										<div class="product-price">
											<a href="#">${plList.sellerid}</a>
										</div>
										<h5>${plList.address}</h5>
										<h5>	
											<fmt:formatNumber value="${plList.price}" pattern="###,###"/> won
										</h5>
										<h5>
											<fmt:parseDate var="regdate" value="${plList.regdate}"
												pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
										</h5>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</td>
	</tr>
</table>
<br><br>
<%@ include file="./../common/main_bottom.jsp" %>